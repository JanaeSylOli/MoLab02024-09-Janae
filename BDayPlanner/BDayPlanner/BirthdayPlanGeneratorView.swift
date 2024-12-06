import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @State private var theme: String = ""
    @State private var activities: [Activity] = []

    var body: some View {
        NavigationWrapper {
            VStack {
                TextField("Enter a Theme", text: $theme)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Generate Random Plan") {
                    if let randomPlan = loadPlans().randomElement() {
                        activities = randomPlan.activities
                    }
                }
                .padding()

                List(activities) { activity in
                    VStack(alignment: .leading) {
                        Text(activity.name)
                            .font(.headline)
                        Text(activity.description)
                        Text("Budget: \(activity.budget)$")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                Button("Save Plan") {
                    let newPlan = BirthdayPlan(id: UUID(), theme: theme, activities: activities)
                    savePlan(newPlan)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .navigationTitle("Plan Generator")
        }
    }
}
