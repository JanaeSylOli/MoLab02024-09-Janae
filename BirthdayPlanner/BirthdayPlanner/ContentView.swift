
import SwiftUI

struct ContentView: View {
    @State private var activityType: String = "recreational"
    @State private var participants: Int = 1
    @State private var activity: String? = nil
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Birthday Activity Generator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Picker("Activity Type", selection: $activityType) {
                    Text("Recreational").tag("recreational")
                    Text("Education").tag("education")
                    Text("Social").tag("social")
                    Text("DIY").tag("diy")
                    Text("Charity").tag("charity")
                    Text("Cooking").tag("cooking")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                Stepper("Number of Participants: \(participants)", value: $participants, in: 1...10)
                    .padding()

                Button(action: fetchActivity) {
                    Text("Generate Activity")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(isLoading)

                if let activity = activity {
                    Text("Suggested Activity:")
                        .font(.headline)
                        .padding(.top)

                    Text(activity)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)
                } else if isLoading {
                    ProgressView("Fetching suggestion...")
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
    }

    func fetchActivity() {
        isLoading = true
        activity = nil

        let urlString = "https://www.boredapi.com/api/activity?type=\(activityType)&participants=\(participants)"
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            isLoading = false

            if let error = error {
                print("Error fetching activity: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let result = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    self.activity = result.activity
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
