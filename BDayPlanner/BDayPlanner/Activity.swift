//
//  Activity.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//
import Foundation

struct Activity: Identifiable {
    let id = UUID() // Unique ID for SwiftUI List usage
    let name: String
    let location: String
    let budget: Double
    let description: String
    let time: String
}
