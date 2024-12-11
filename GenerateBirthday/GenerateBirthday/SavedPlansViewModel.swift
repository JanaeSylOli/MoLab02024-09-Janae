import Foundation

class SavedPlansViewModel: ObservableObject {
    @Published var savedPlans: [SavedPlan] = []

    init() {
        loadPlans()
    }

    func savePlan(theme: String, places: [Place], events: [Event]) {
        let newPlan = SavedPlan(theme: theme, places: places, events: events)
        savedPlans.append(newPlan)
        savePlans()
    }

    private func loadPlans() {
        if let data = UserDefaults.standard.data(forKey: "savedPlans") {
            if let decodedPlans = try? JSONDecoder().decode([SavedPlan].self, from: data) {
                savedPlans = decodedPlans
            }
        }
    }

    private func savePlans() {
        if let encodedPlans = try? JSONEncoder().encode(savedPlans) {
            UserDefaults.standard.set(encodedPlans, forKey: "savedPlans")
        }
    }
}
