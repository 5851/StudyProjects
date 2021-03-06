//
//  SuffixService.swift
//  DataStructuresProfiling
//
//  Created by MAC on 17.01.2021.
//  Copyright © 2021 Максим Елисеев. All rights reserved.
//

import Foundation

enum ArraySortType: String {
    case ASC
    case DESC
}

extension String {
    var lettersAndSpaces: String {
        return components(separatedBy: CharacterSet.letters.union(.whitespaces).inverted).joined()
    }
}

final class SuffixService {

    // MARK: - Properties
    private var sequenceArray: [SuffixSequence] = [SuffixSequence]()
    private var allSuffixesArray: [SuffixStruct] = [SuffixStruct]()
    private var currentSuffixesArray: [SuffixStruct] = [SuffixStruct]()

    // MARK: - Public methods
    public init(sentence: String? = nil) {
        self.prepareSuffixArray(initialSentence: sentence)
    }

    public func prepareSuffixArrayWithTimer(initialSentence: String?) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.prepareSuffixArray(initialSentence: initialSentence)
        }
    }

    public func prepareSuffixArray(initialSentence: String?) {

        guard let initialSentence = initialSentence else {
            sequenceArray = [SuffixSequence]()
            allSuffixesArray = [SuffixStruct]()
            return
        }


        let wordsArray = initialSentence.lettersAndSpaces.components(separatedBy: " ")

        for word in wordsArray {
            sequenceArray.append(SuffixSequence(string: word))
        }

        var suffixArray: [Substring] = [Substring]()

        for sequence in sequenceArray {
            for suffix in sequence {
                suffixArray.append(suffix)
                self.addSuffix(suffix)
            }
        }

        self.sortArray(.ASC)
        self.currentSuffixesArray = allSuffixesArray
    }

    public func getSuffixCount() -> Int {
        return currentSuffixesArray.count
    }

    public func getSuffixByIndex(_ index: Int) -> SuffixStruct {
        return currentSuffixesArray[index]
    }

    public func sortAllSuffixes() {
        self.currentSuffixesArray = allSuffixesArray
    }

    public func sortTopSuffixArray(sortingLettersCount: Int) {
        self.currentSuffixesArray = allSuffixesArray
        self.currentSuffixesArray = allSuffixesArray.filter { currentSuffix in
            return currentSuffix.suffix.count == sortingLettersCount
        }

        self.currentSuffixesArray.sort {
            $0.appearanceCount > $1.appearanceCount
        }

        self.currentSuffixesArray = Array(currentSuffixesArray.prefix(10))
    }

    public func sortArray(_ sortingType: ArraySortType) {
        switch sortingType {
        case .ASC:
            allSuffixesArray.sort {
                $0.suffix < $1.suffix
            }
        case .DESC:
            allSuffixesArray.sort {
                $0.suffix > $1.suffix
            }
        }
        self.currentSuffixesArray = allSuffixesArray
    }

    // MARK: - Private methods
    private func addSuffix(_ suffix: Substring) {
        if let oldSuffixIndex = self.allSuffixesArray.firstIndex(where:{$0.suffix == suffix}) {
            allSuffixesArray[oldSuffixIndex].appearanceCount += 1
        } else {
            allSuffixesArray.append(SuffixStruct(suffix: suffix))
        }
     }

}
