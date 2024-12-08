//
//  BirthdayPlan.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.



import Foundation

struct BirthdayPlansWrapper: Codable {
    let birthdayPlans: [BirthdayPlan]
}

struct BirthdayPlan: Codable {
    let theme: String
    let activities: [Activity]
}
