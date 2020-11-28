//
//  Date+Extensions.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Date {
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        return formatter.string(from: self)
    }
}
