//
//  BirthdayPlan.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
import Foundation



struct BirthdayPlan: Identifiable {
    let id = UUID() // Unique ID for SwiftUI List usage
    let theme: String
    let activities: [Activity]
}
