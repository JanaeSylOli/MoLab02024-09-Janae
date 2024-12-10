import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @State private var inputTheme: String = ""
    @State private var generatedPlan: [Activity] = []
    private let plans = DataLoader().loadBirthdayPlans() ?? []

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter plan theme", text: $inputTheme)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: generatePlan) {
                Text("Generate Plan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            List(generatedPlan, id: \.name) { activity in
                ActivityCard(activity: activity)
            }
        }
        .padding()
        .navigationTitle("Plan Generator")
    }

    private func generatePlan() {
        if let selectedPlan = plans.first(where: { $0.theme.lowercased() == inputTheme.lowercased() }) {
            generatedPlan = selectedPlan.activities
        } else {
            generatedPlan = []
        }
    }
}

struct ActivityCard: View {
    let activity: Activity

    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.name)
                .font(.headline)
            Text(activity.location)
                .font(.subheadline)
            Text("\(activity.budget) USD")
                .font(.subheadline)
            Text(activity.description)
                .font(.body)
            Text(activity.time)
                .font(.body)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.vertical, 5)
    }
}
