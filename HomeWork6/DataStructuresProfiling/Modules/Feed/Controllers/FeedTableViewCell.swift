//
//  FeedTableViewCell.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseID = String(describing: FeedTableViewCell.self)

    // MARK: - Oulets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var time: UILabel!

    // MARK: - Configure Cell
    func updateCell(name: String, time: String) {
        self.nameLabel.text = name
        self.time.text = time
    }
}
