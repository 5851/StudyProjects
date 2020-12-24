//
//  Model.swift
//  HomeWork9
//
//  Created by MAC on 24.12.2020.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String { return name }
}

let modelData = [
    Model(name: "test1"),
    Model(name: "test2"),
    Model(name: "test3"),
    Model(name: "test4"),
    Model(name: "test5"),
    Model(name: "test6"),
    Model(name: "test7"),
    Model(name: "test8"),
    Model(name: "test9"),
    Model(name: "test10"),
    Model(name: "test11"),
    Model(name: "test12")
]
