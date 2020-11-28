//
//  FeedViewController.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 01/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var allCreateTestButton: UIButton!
    @IBOutlet weak var allAccessTestButton: UIButton!

    // MARK: - Properties
    private var feedData = Services.feedProvider.feedMockData()
    let arrayManipulator: ArrayManipulator = SwiftArrayManipulator()
    let dictionaryManipulator: DictionaryManipulator = SwiftDictionaryManipulator()
    let setManipulator = SwiftSetManipulator()
    let jobScheduler = SwiftJobScheduler()
    lazy fileprivate var timeNumberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let digits = 6
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        return formatter
    }()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.tableFooterView = UIView()
        allCreateTestButton.addTarget(self, action: #selector(allCreateTap), for: .touchUpInside)
        allAccessTestButton.addTarget(self, action: #selector(allAccessTap), for: .touchUpInside)
    }

    // MARK: - Selectors
    @objc func allCreateTap() {
        let arrayAction = Action {
            let time = self.formattedTime(self.arrayManipulator.setupWithObjectCount(10000))!

            DispatchQueue.main.async {
                self.feedData[0].time = time
                self.feedTableView.reloadData()
            }
        }

        let setAction = Action {
            let time = self.formattedTime(self.setManipulator.setupWithObjectCount(10000))!

            DispatchQueue.main.async {
                self.feedData[1].time = time
                self.feedTableView.reloadData()
            }

        }

        let dictionaryAction = Action {
            let time = self.formattedTime(self.dictionaryManipulator.setupWithEntryCount(10000))!

            DispatchQueue.main.async {
                self.feedData[2].time = time
                self.feedTableView.reloadData()
            }
        }

        jobScheduler.createJobQueue(actions: [arrayAction, setAction, dictionaryAction])
        jobScheduler.runJobQueue()
    }

    @objc func allAccessTap() {
        let arrayAction = Action {
            let time = self.formattedTime(self.arrayManipulator.lookupByIndex())!

            DispatchQueue.main.async {
                self.feedData[0].time = time
                self.feedTableView.reloadData()
            }
        }

        let setAction = Action {
            let time = self.formattedTime(self.setManipulator.lookup1Object())!

            DispatchQueue.main.async {
                self.feedData[1].time = time
                self.feedTableView.reloadData()
            }

        }

        let dictionaryAction = Action {
            let time = self.formattedTime(self.dictionaryManipulator.lookup1EntryTime())!

            DispatchQueue.main.async {
                self.feedData[2].time = time
                self.feedTableView.reloadData()
            }
        }

        jobScheduler.createJobQueue(actions: [arrayAction, setAction, dictionaryAction])
        jobScheduler.runJobQueue()
    }

    func formattedTime(_ time: TimeInterval) -> String? {
      return timeNumberFormatter.string(from: time as NSNumber)
    }
}

// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseID, for: indexPath) as? FeedTableViewCell
        guard let feedCell = cell else { return UITableViewCell() }

        feedCell.updateCell(name: feedData[indexPath.row].name, time: feedData[indexPath.row].time)
        return feedCell
    }
}

// MARK: - UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        var vc: UIViewController?

        if let currentCell = tableView.cellForRow(at: indexPath) as? FeedTableViewCell, let name = currentCell.nameLabel.text {
            switch name {
            case "Array":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "ArrayViewController")
            case "Set":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "SetViewController")
            case "Dictionary":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "DictionaryViewController")
            case "SuffixArray":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                // TODO
                vc = storyboard.instantiateViewController(withIdentifier: "SuffixArrayViewController")
            default:
                let storyboard = UIStoryboard(name: "Feed", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewController")
            }
        }

        if let pushViewController = vc {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
    }
}
