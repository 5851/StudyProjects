//
//  FeedViewController.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 01/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: - Properties
    private let feedData = Services.feedProvider.feedMockData()

    // MARK: - Outlets
    @IBOutlet weak var feedTableView: UITableView!

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.tableFooterView = UIView()
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
        
        feedCell.updateCell(name: feedData[indexPath.row].name)
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
