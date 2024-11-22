//
//  AcivityModel.swift
//  BirthdayPlanner
//
//  Created by Janae  Sylvester Oliver on 11/22/24.
//
 
import Foundation

struct Activity: Decodable {
    let activity: String
    let type: String
    let participants: Int
}

