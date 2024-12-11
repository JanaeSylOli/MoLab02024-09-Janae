import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @State private var inputTheme: String = ""
    @State private var generatedPlan: [Activity] = []
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter plan theme", text: $inputTheme)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(maxWidth: 300)

            Button(action: generatePlan) {
                Text("Generate Plan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if isLoading {
                ProgressView()
                    .padding()
            } else {
                List(generatedPlan, id: \.name) { activity in
                    ActivityCard(activity: activity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
        .navigationTitle("Plan Generator")
    }

    private func generatePlan() {
        isLoading = true
        NetworkManager.shared.fetchActivities(for: inputTheme) { activities in
            isLoading = false
            if let activities = activities {
                generatedPlan = activities
            } else {
                generatedPlan = []
            }
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
