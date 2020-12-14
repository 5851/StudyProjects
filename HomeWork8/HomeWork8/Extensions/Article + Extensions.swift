//
//  Article + Extensions.swift
//  HomeWork8
//
//  Created by MAC on 13.12.2020.
//

import Foundation
import NewsAPINetwork

extension Article: Identifiable {

    public var id: String {
        url ?? UUID().uuidString
    }

}
