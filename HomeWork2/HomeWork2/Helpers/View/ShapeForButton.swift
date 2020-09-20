//
//  ShapeForButton.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct ShapeForButton: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 15, height: 15))

        return Path(path.cgPath)
    }
}
