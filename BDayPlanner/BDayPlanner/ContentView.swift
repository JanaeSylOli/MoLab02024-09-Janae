import SwiftUI
import SideMenu

struct ContentView: View {
    @State private var isMenuOpen = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.isMenuOpen.toggle()
                }) {
                    Text("Open Menu")
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.isMenuOpen.toggle()
            }) {
                Image(systemName: "line.horizontal.3")
            })
        }
        .background(
            SideMenu(isMenuOpen: $isMenuOpen) {
                MenuView(isMenuOpen: $isMenuOpen)
            }
        )
    }
}

struct MenuView: View {
    @Binding var isMenuOpen: Bool

    var body: some View {
        VStack {
            NavigationLink(destination: HomeView()) {
                Text("Home")
            }
            NavigationLink(destination: BirthdayPlanGeneratorView()) {
                Text("Birthday Plan Generator")
            }
            NavigationLink(destination: SavedPlansView()) {
                Text("Saved Plans")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}


#Preview {
    ContentView(savedPlans: <#[BirthdayPlan]#>)
}
