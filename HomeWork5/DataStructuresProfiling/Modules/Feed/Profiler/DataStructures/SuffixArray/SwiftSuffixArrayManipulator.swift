//
//  SwiftSuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func arrayHasObjects() -> Bool
    func createArrayFromAlgoProvider () -> TimeInterval
    func findRandomSubstrings(countOfIterations: Int) -> TimeInterval
}
