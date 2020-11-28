//
//  JobScheduler.swift
//  DataStructuresProfiling
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

protocol JobScheduler {
    func hasJobs() -> Bool
    func createJobQueue(actions: [Action])
    func runJobQueue()
}
