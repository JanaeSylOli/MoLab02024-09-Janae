import Foundation

class Utilities {
    private let userDefaultsKey = "SavedPlans"
    
    func savePlans(_ plans: [BirthdayPlan]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(plans) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    func loadPlans() -> [BirthdayPlan] {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let loadedPlans = try? decoder.decode([BirthdayPlan].self, from: savedData) {
            return loadedPlans
        }
        return []
    }
    
    func clearSavedPlans() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
