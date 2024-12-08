import Foundation

struct BirthdayPlan: Codable, Identifiable {
    let id = UUID() // Unique identifier
    let theme: String
    let activities: [Activity]
}

struct Activity: Codable, Identifiable {
    let id = UUID() // Unique identifier
    let name: String
    let location: String
    let budget: Double
    let description: String
    let time: String
}

class Utilities {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let savedPlansKey = "savedPlans"

    /// Save an array of birthday plans using UserDefaults
    func savePlans(_ plans: [BirthdayPlan]) {
        do {
            let data = try encoder.encode(plans) // Encode the data
            UserDefaults.standard.set(data, forKey: savedPlansKey) // Save to UserDefaults
            print("Plans saved successfully!")
        } catch {
            print("Failed to save plans: \(error.localizedDescription)")
        }
    }

    /// Load saved birthday plans from UserDefaults
    func loadPlans() -> [BirthdayPlan] {
        guard let data = UserDefaults.standard.data(forKey: savedPlansKey) else {
            print("No saved plans found.")
            return []
        }

        do {
            let plans = try decoder.decode([BirthdayPlan].self, from: data) // Decode the data
            print("Plans loaded successfully!")
            return plans
        } catch {
            print("Failed to load plans: \(error.localizedDescription)")
            return []
        }
    }

    /// Clear all saved plans from UserDefaults
    func clearSavedPlans() {
        UserDefaults.standard.removeObject(forKey: savedPlansKey)
        print("All plans have been cleared.")
    }
}
