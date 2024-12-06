import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationWrapper {
                VStack {
                    Text("Welcome to BDay Planner!")
                        .font(.largeTitle)
                        .padding()
                }
                .navigationTitle("Main Menu") // Title for the navigation bar
            }
        }
    }
}




#Preview {
    ContentView()
}