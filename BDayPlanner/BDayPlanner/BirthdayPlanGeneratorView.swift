import SwiftUI

struct BirthdayPlanGeneratorView: View {
    let savedPlans: [BirthdayPlan]
    @State private var selectedTheme: String = ""
    @State private var generatedPlan: Activity?
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Enter a theme (e.g., Adventure)", text: $selectedTheme)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding()

            Button(action: generatePlan) {
                Text("Generate Plan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if let plan = generatedPlan {
                VStack(alignment: .leading) {
                    Text("Activity: \(plan.name)")
                    Text("Location: \(plan.location)")
                    Text("Budget: $\(plan.budget, specifier: "%.2f")")
                    Text("Description: \(plan.description)")
                    Text("Time: \(plan.time)")
                }
                .padding()
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Plan Generator")
    }

    func generatePlan() {
        guard let plan = savedPlans.first(where: { $0.theme.lowercased() == selectedTheme.lowercased() })?.activities.randomElement() else {
            errorMessage = "No plans found for theme: \(selectedTheme)"
            generatedPlan = nil
            return
        }
        generatedPlan = plan
        errorMessage = nil
    }
}
