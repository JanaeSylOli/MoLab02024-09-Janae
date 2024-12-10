import Foundation

class DataLoader {
    func loadBirthdayPlans() -> [BirthdayPlan]? {
        if let url = Bundle.main.url(forResource: "birthday_plans", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let plans = try JSONDecoder().decode([BirthdayPlan].self, from: data)
                print("Successfully loaded plans: \(plans)") // Debugging statement
                return plans
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found") // Debugging statement
        }
        return nil
    }
}
