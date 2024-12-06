//
//  BirthdayPlan.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//
import Foundation

struct BirthdayPlan: Codable, Identifiable {
    let id: UUID
    let theme: String
    let activities: [Activity]
}
