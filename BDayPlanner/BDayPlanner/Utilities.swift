import Foundation

func loadJSONData() -> [BirthdayPlan] {
    guard let url = Bundle.main.url(forResource: "birthday_plans", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let birthdayPlans = try? JSONDecoder().decode([BirthdayPlan].self, from: data) else {
        print("Failed to load JSON data.")
        return []
    }
    return birthdayPlans
}

