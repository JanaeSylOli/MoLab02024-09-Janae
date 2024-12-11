import SwiftUI

struct MenuView: View {
    @Binding var isMenuOpen: Bool

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: HomeView()) {
                Text("Home")
                    .padding()
            }
            NavigationLink(destination: BirthdayPlanGeneratorView()) {
                Text("Birthday Plan Generator")
                    .padding()
            }
            NavigationLink(destination: SavedPlansView()) {
                Text("Saved Plans")
                    .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
