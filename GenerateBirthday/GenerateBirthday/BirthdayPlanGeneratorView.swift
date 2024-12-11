import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @State private var inputTheme: String = ""
    @State private var places: [Place] = []
    @State private var events: [Event] = []
    @State private var isLoading = false
    @ObservedObject var viewModel: SavedPlansViewModel

    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .frame(height: 200)
                .overlay(
                    Text("GenerateBirthday")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                )
                .edgesIgnoringSafeArea(.top)

            VStack(spacing: 20) {
                TextField("Enter plan theme", text: $inputTheme)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: 300)

                Button(action: generatePlans) {
                    Text("Generate Plans")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if isLoading {
                    ProgressView()
                        .padding()
                } else {
                    List {
                        Section(header: Text("Places")) {
                            ForEach(places, id: \.id) { place in
                                PlaceCard(place: place)
                            }
                        }
                        Section(header: Text("Events")) {
                            ForEach(events, id: \.id) { event in
                                EventCard(event: event)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                Button(action: savePlan) {
                    Text("Save Plan")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
    }

    private func generatePlans() {
        isLoading = true
        NetworkManager.shared.fetchPlaces(for: inputTheme) { fetchedPlaces in
            DispatchQueue.main.async {
                self.places = fetchedPlaces ?? []
                self.checkLoadingStatus()
            }
        }
        EventbriteManager().fetchEvents(for: inputTheme) { fetchedEvents in
            DispatchQueue.main.async {
                self.events = fetchedEvents ?? []
                self.checkLoadingStatus()
            }
        }
    }

    private func checkLoadingStatus() {
        if !places.isEmpty || !events.isEmpty {
            isLoading = false
        }
    }
    
    private func savePlan() {
        viewModel.savePlan(theme: inputTheme, places: places, events: events)
    }
}

struct PlaceCard: View {
    let place: Place

    var body: some View {
        NavigationLink(destination: PlaceView(place: place)) {
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.location)
                    .font(.subheadline)
                Text("\(place.budget) USD")
                    .font(.subheadline)
                Text(place.description)
                    .font(.body)
                Text(place.time)
                    .font(.body)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.vertical, 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct EventCard: View {
    let event: Event

    var body: some View {
        NavigationLink(destination: EventView(event: event)) {
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.headline)
                Text(event.description)
                    .font(.subheadline)
                Text("Starts: \(event.start, formatter: Date.formatter)")
                    .font(.subheadline)
                Text("Ends: \(event.end, formatter: Date.formatter)")
                    .font(.subheadline)
                Text("URL: \(event.url)")
                    .font(.body)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.vertical, 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
