import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    Text("Welcome to Birthday Planner!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    NavigationLink(destination: BirthdayPlanGeneratorView()) {
                        Text("Start Planning")
                            .font(.title)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Home")
    }
}
