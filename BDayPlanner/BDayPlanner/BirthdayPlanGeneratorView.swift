import SwiftUI
import FirebaseFirestore

struct BirthdayPlanGeneratorView: View {
    @State private var theme: String = "" // User-inputted theme
    @State private var birthdayPlans: [BirthdayPlan] = [] // List of fetched plans
    @State private var selectedPlan: BirthdayPlan? // Plan to display
    @State private var isLoading: Bool = false // Loading state
    @State private var errorMessage: String? // Error message

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Theme input
                TextField("Enter a Theme", text: $theme)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Generate Button
                Button(action: {
                    saveNewPlan()
                }) {
                    Text("Save Birthday Plan")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(theme.isEmpty) // Disable button if theme is empty
                
                // Fetch Button
                Button(action: {
                    fetchPlans()
                }) {
                    Text("Fetch Birthday Plans")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Loading Indicator
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                }

                // Display Error Message
                if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }

                // Display Selected Plan
                if let selectedPlan = selectedPlan {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Selected Plan: \(selectedPlan.theme)")
                            .font(.headline)
                        ForEach(selectedPlan.activities, id: \.name) { activity in
                            VStack(alignment: .leading) {
                                Text("Activity: \(activity.name)")
                                Text("Location: \(activity.location)")
                                Text("Budget: $\(activity.budget, specifier: "%.2f")")
                                Text("Description: \(activity.description)")
                                Text("Time: \(activity.time)")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                }

                // List of Birthday Plans
                List(birthdayPlans) { plan in
                    Button(action: {
                        selectedPlan = plan
                    }) {
                        Text(plan.theme)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Plan Generator")
            .padding()
        }
    }

    // MARK: - Save Plan Function
    func saveNewPlan() {
        let sampleActivities = [
            Activity(name: "Hiking", location: "Green Valley", budget: 50.0, description: "A scenic hiking trail", time: "9:00 AM - 12:00 PM"),
            Activity(name: "Picnic", location: "Riverside Park", budget: 20.0, description: "Relax with food and friends", time: "1:00 PM - 3:00 PM")
        ]

        let newPlan = BirthdayPlan(theme: theme, activities: sampleActivities)

        isLoading = true
        errorMessage = nil

        FirebaseService.shared.saveBirthdayPlan(plan: newPlan) { result in
            isLoading = false
            switch result {
            case .success:
                print("Plan saved successfully!")
                theme = "" // Clear the input field
            case .failure(let error):
                errorMessage = "Failed to save plan: \(error.localizedDescription)"
            }
        }
    }

    // MARK: - Fetch Plans Function
    func fetchPlans() {
        isLoading = true
        errorMessage = nil

        FirebaseService.shared.fetchBirthdayPlans { result in
            isLoading = false
            switch result {
            case .success(let plans):
                self.birthdayPlans = plans
                print("Fetched plans: \(plans)")
            case .failure(let error):
                errorMessage = "Failed to fetch plans: \(error.localizedDescription)"
            }
        }
    }
}
