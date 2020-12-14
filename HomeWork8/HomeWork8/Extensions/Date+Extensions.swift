//
//  Date+Extensions.swift
//  HomeWork8
//
//  Created by MAC on 14.12.2020.
//

import Foundation

extension Date {
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        return formatter.string(from: self)
    }
}
