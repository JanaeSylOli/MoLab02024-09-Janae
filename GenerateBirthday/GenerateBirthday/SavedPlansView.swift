import SwiftUI

struct SavedPlansView: View {
    @ObservedObject var viewModel: SavedPlansViewModel
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .frame(height: 200)
                .overlay(
                    Text("Saved Plans")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                )
                .edgesIgnoringSafeArea(.top)
            
            List {
                ForEach(viewModel.savedPlans) { plan in
                    VStack(alignment: .leading) {
                        Text(plan.theme)
                            .font(.headline)
                        ForEach(plan.places) { place in
                            Text(place.name)
                                .font(.subheadline)
                        }
                        ForEach(plan.events) { event in
                            Text(event.name)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.vertical, 5)
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
    }
}

struct SavedPlansView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPlansView(viewModel: SavedPlansViewModel())
    }
}
