//
//  SuffixArrayViewController.swift
//  DataStructuresProfiling
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2021 Максим Елисеев. All rights reserved.
//

import UIKit

private enum ArrayVCRow: Int {
    case creation = 0,
    substringsSearchTime
}

class SuffixArrayViewController: DataStructuresViewController {

    //MARK: - Variables
    let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    var creationTime: TimeInterval = 0
    var substringsSearchTime: TimeInterval = 0

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray, Sort and Test", for: [])
    }

    //MARK: - Superclass creation/testing overrides
    override func create(_ countOfIterations: Int) {
        creationTime = suffixArrayManipulator.createArrayFromAlgoProvider()
        substringsSearchTime = suffixArrayManipulator.findRandomSubstrings(countOfIterations: countOfIterations)
    }

    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch (indexPath as NSIndexPath).row {
        case ArrayVCRow.creation.rawValue:
            cell.textLabel!.text = "Creation and Sorting:"
            cell.detailTextLabel!.text = formattedTime(creationTime)
        case ArrayVCRow.substringsSearchTime.rawValue:
            cell.textLabel!.text = "Search substrings"
            cell.detailTextLabel!.text = formattedTime(substringsSearchTime)
        default:
            print("Unhandled row! \((indexPath as NSIndexPath).row)")
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
