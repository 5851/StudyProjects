//
//  FeedThirdViewController.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class FeedThirdViewController: UIViewController {

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func showFeedFirstController() {
        navigationController?.popToRootViewController(animated: true)
    }
}
