import SwiftUI

struct NavigationWrapper<Content: View>: View {
    @State private var showMenu = false // Controls menu visibility
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Main content
            content
                .padding()

            // Hamburger menu
            if showMenu {
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(destination: HomeView()) {
                        Text("Home")
                    }
                    NavigationLink(destination: BirthdayPlanGeneratorView()) {
                        Text("Birthday Plan Generator")
                    }
                    NavigationLink(destination: UtilitiesView()) {
                        Text("Utilities")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
                .offset(x: -45, y: -320)  // Adjust position of the menu
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    showMenu.toggle() // Toggle menu visibility
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline) // Use inline title style
    }
}
