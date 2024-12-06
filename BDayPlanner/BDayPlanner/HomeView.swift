import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationWrapper {
            VStack {
                Text("Welcome to the Home Page!")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Home") // Title for the navigation bar
        }
    }
}

