//
//  Utilities.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//

import Foundation
import UIKit

/// Save a single birthday plan using UserDefaults
func savePlan(_ plan: BirthdayPlan) {
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(plan)
        UserDefaults.standard.set(data, forKey: "savedPlan")
        print("Plan saved successfully.")
    } catch {
        print("Failed to save plan: \(error.localizedDescription)")
    }
}

/// Load a saved plan from UserDefaults
func loadSavedPlan() -> BirthdayPlan? {
    if let data = UserDefaults.standard.data(forKey: "savedPlan") {
        let decoder = JSONDecoder()
        do {
            let plan = try decoder.decode(BirthdayPlan.self, from: data)
            print("Plan loaded successfully.")
            return plan
        } catch {
            print("Failed to load plan: \(error.localizedDescription)")
        }
    }
    print("No saved plan found.")
    return nil
}

/// Clear the saved plan from UserDefaults
func clearSavedPlan() {
    UserDefaults.standard.removeObject(forKey: "savedPlan")
    print("Saved plan cleared.")
}

/// Share a plan using the iOS Share Sheet
func sharePlan(plan: BirthdayPlan) {
    let text = """
    Check out my birthday plan:
    Theme: \(plan.theme)
    Activities:
    \(plan.activities.map { "\($0.name) at \($0.location)" }.joined(separator: "\n"))
    """

    let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)

    // Use the appropriate window scene to present the Share Sheet
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let rootViewController = windowScene.windows.first?.rootViewController {
        rootViewController.present(activityVC, animated: true, completion: nil)
    }
    print("Shared plan via Share Sheet.")
}

/// Load plans from a local JSON file
func loadPlans() -> [BirthdayPlan] {
    print("loadPlans")
    guard let url = Bundle.main.url(forResource: "birthday_plans", withExtension: "json") else {
        print("JSON file not found in the app bundle.")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let plans = try JSONDecoder().decode([BirthdayPlan].self, from: data)
        print("Plans loaded from JSON successfully.")
        return plans
    } catch {
        print("Error loading plans from - JSON: \(error.localizedDescription)")
        return []
    }
}
