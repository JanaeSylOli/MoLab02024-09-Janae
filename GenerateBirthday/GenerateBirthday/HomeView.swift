import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: SavedPlansViewModel

    var body: some View {
        NavigationView {
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
                    Text("Welcome to the Birthday Plan Generator!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()

                    NavigationLink(destination: BirthdayPlanGeneratorView(viewModel: viewModel)) {
                        Text("Start Planning")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: SavedPlansViewModel())
    }
}
