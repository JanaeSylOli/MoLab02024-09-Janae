import SwiftUI

struct NavigationWrapper<Content: View>: View {
    @State private var showMenu = false
    let savedPlans: [BirthdayPlan]
    let content: Content

    init(savedPlans: [BirthdayPlan], @ViewBuilder content: () -> Content) {
        self.savedPlans = savedPlans
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
                    NavigationLink(destination: ContentView(savedPlans: savedPlans)) {
                        Text("Home")
                    }
                    NavigationLink(destination: BirthdayPlanGeneratorView(savedPlans: $savedPlans)) {
                        Text("Birthday Plan Generator")
                    }
                    NavigationLink(destination: UtilitiesView(savedPlans: savedPlans)) {
                        Text("Utilities")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
                .offset(x: 0, y: 70) // Adjust position of the menu
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    showMenu.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
