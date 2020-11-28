//
//  SuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

struct SuffixSequence: Sequence {
    let string: String
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}

struct SuffixIterator: IteratorProtocol {
    let string: String
    var offset: String.Index
    init(string: String) {
        self.string = string
        offset = string.endIndex
    }
    mutating func next() -> Substring? {
        guard offset > string.startIndex else { return nil }
        offset = string.index(before: offset)
        return string[offset...]
    }
}

open class SwiftSuffixArrayManipulator: SuffixArrayManipulator {

    fileprivate var suffixArray = [(SuffixSequence, String)]()

    open func arrayHasObjects() -> Bool {
        if suffixArray.count == 0 {
            return false
        } else {
            return true
        }
    }

    open func createArrayFromAlgoProvider() -> TimeInterval {

        let algs = AlgoProvider.init().all

        return Profiler.runClosureForTime() {

            self.suffixArray = [(SuffixSequence, String)]()
            for i in 0 ..< algs.count {

                let suffixSequence = SuffixSequence(string: algs[i])

                let algTuple = (suffixSequence, algs[i])

                self.suffixArray.append(algTuple)
            }

            self.suffixArray.sort {(algTuple1, algTuple2) -> Bool in
                let algName1 = algTuple1.1
                let algName2 = algTuple2.1
                return algName1.localizedCaseInsensitiveCompare(algName2) == .orderedAscending
            }
        }
    }

    open func findRandomSubstrings(countOfIterations: Int) -> TimeInterval {
        let stringGenerator = StringGenerator.init()
        var randomStrings = [String]()// = stringGenerator.generateRandomString(3);

        var i = countOfIterations
        while i > 0 {
            randomStrings.append(stringGenerator.generateRandomString(3))
            i-=1
        }

        return Profiler.runClosureForTime() {
            for randomString in randomStrings
            {
                _ = self.suffixArray.first {(algTuple) -> Bool in
                    return algTuple.1.contains(randomString)
                }
            }
        }
    }
}
