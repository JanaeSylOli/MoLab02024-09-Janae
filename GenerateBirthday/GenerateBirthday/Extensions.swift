//
//  Extensions.swift
//  GenerateBirthday
//
//  Created by Janae  Sylvester Oliver on 12/11/24.
//

import Foundation

extension Date {
    static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}
