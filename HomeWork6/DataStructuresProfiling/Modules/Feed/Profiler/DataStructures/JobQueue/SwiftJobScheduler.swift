//
//  SwiftJobScheduler.swift
//  DataStructuresProfiling
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

struct Job {
    let dispatchQueue: DispatchQueue
    let actionToPerform: Action
}

struct Action {
    private let f: () -> ()

    init(_ f: @escaping () -> ()) {
        self.f = f
    }

    func run() {
        f()
    }
}

open class SwiftJobScheduler: JobScheduler {
    fileprivate var jobQueue = [Job]()

    func hasJobs() -> Bool {
        return jobQueue.count > 0
    }

    func createJobQueue(actions: [Action]) {
        jobQueue = [Job]()

        var queueIndex = 0;

        for action in actions {
            let dispatchQueue = DispatchQueue(label: "Q\(queueIndex)")
            let job = Job(dispatchQueue: dispatchQueue, actionToPerform: action)
            jobQueue.append(job)
            queueIndex += 1
        }
    }

    func runJobQueue() {
        for job in jobQueue {
            job.dispatchQueue.async {
                job.actionToPerform.run()
            }
        }
    }
}
