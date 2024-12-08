import SwiftUI

struct UtilitiesView: View {
    let savedPlans: [BirthdayPlan]

    var body: some View {
        VStack {
            if savedPlans.isEmpty {
                Text("No saved plans available.")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                List(savedPlans, id: \.theme) { plan in
                    Section(header: Text("Theme: \(plan.theme)")) {
                        ForEach(plan.activities, id: \.name) { activity in
                            VStack(alignment: .leading) {
                                Text("Activity: \(activity.name)")
                                    .font(.headline)
                                Text("Location: \(activity.location)")
                                Text("Budget: $\(activity.budget, specifier: "%.2f")")
                                Text("Description: \(activity.description)")
                                Text("Time: \(activity.time)")
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Saved Plans")
    }
}
