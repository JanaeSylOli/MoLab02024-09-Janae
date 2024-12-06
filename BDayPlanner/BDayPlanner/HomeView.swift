import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationWrapper {
            VStack {
                Text("Home Page")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}
