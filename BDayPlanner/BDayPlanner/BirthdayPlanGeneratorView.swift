import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @Binding var savedPlans: [BirthdayPlan]
    @State private var selectedActivity: Activity?
    @State private var selectedTheme: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Enter a theme", text: $selectedTheme)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            Button(action: generatePlan) {
                Text("Generate Random Plan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            if let activity = selectedActivity {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Activity: \(activity.name)")
                        .font(.headline)
                    Text("Location: \(activity.location)")
                    Text("Budget: $\(activity.budget, specifier: "%.2f")")
                    Text("Description: \(activity.description)")
                    Text("Time: \(activity.time)")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Plan Generator")
    }

    private func generatePlan() {
        guard let plan = savedPlans.first(where: { $0.theme.lowercased() == selectedTheme.lowercased() }) else {
            errorMessage = "No plans found for theme: \(selectedTheme)"
            selectedActivity = nil
            return
        }
        selectedActivity = plan.activities.randomElement()
        errorMessage = nil
    }
}
