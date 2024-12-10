//
//  DataLoader.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/9/24.
//

import Foundation

class DataLoader {
    func loadBirthdayPlans() -> [BirthdayPlan]? {
        if let url = Bundle.main.url(forResource: "birthday_plans", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let plans = try JSONDecoder().decode([BirthdayPlan].self, from: data)
                return plans
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return nil
    }
}
