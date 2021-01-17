//
//  SuffixListController.swift
//  DataStructuresProfiling
//
//  Created by MAC on 17.01.2021.
//  Copyright © 2021 Максим Елисеев. All rights reserved.
//

import UIKit
import Combine

class SuffixListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortingLabel: UILabel!
    @IBOutlet weak var sortingSwitch: UISwitch!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var stackView: UIStackView!

    // MARK: - Properties
    var suffixService = SuffixService()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        initSuffixArray()
    }

    // MARK: - Actions
    @IBAction func switcherChanged(_ sender: Any) {
        sortingSwitch.isOn ? sortSuffixArray(.DESC) :  sortSuffixArray(.ASC)
    }

    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.stackView.isHidden = false
            sortAllSufixes()
        case 1:
            self.stackView.isHidden = true
            sortTop3Suffixes()
        case 2:
            self.stackView.isHidden = true
            sortTop5Suffixes()
        default:
            break
        }
    }

    // MARK: - Main methods
    func initSuffixArray() {
        let processedText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        self.suffixService = SuffixService(sentence: processedText)
        self.tableView.reloadData()
    }

    // MARK: - Sorting methods
    private func sortSuffixArray(_ sorting: ArraySortType) {
        suffixService.sortArray(sorting)
        sortingLabel.text = sorting.rawValue
        self.tableView.reloadData()
    }

    private func sortAllSufixes() {
        suffixService.sortAllSuffixes()
        self.tableView.reloadData()
    }

    private func sortTop3Suffixes() {
        suffixService.sortTopSuffixArray(sortingLettersCount: 3)
        self.tableView.reloadData()
    }

    private func sortTop5Suffixes() {
        suffixService.sortTopSuffixArray(sortingLettersCount: 5)
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SuffixListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suffixService.getSuffixCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let suffixStruct = suffixService.getSuffixByIndex(indexPath.row)
        cell.textLabel?.text = String(suffixStruct.suffix)
        cell.detailTextLabel?.text = suffixStruct.appearanceCount > 1 ? String(format: "%d appearances", suffixStruct.appearanceCount) : ""
        return cell
    }
}

// MARK: - Configure UI
extension SuffixListViewController {
    private func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
