import SwiftUI


struct ContentView: View {
    @State private var savedPlans: [BirthdayPlan] = loadJSONData()

    var body: some View {
        NavigationWrapper(savedPlans: savedPlans) {
            VStack {
                Text("Welcome to BDay Planner!")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: BirthdayPlanGeneratorView(savedPlans: $savedPlans)) {
                    Text("Start Planning")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Main Menu")
        }
    }
}
#Preview {
    ContentView()
}
