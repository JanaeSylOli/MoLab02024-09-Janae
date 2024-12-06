//
//  Activity.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//
import Foundation

struct Activity: Codable, Identifiable {
    let id: UUID
    let name: String
    let location: String
    let budget: Int
    let description: String
}
