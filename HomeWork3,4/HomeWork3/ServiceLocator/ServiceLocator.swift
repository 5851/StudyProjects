//
//  ServiceLocator.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class ServiceLocator {

    private lazy var services: [String: Any] = [:]

    func addService<T>(service: T) {
        let key = "\(T.self)"
        services[key] = service
    }
    func getService<T>() -> T {
        let key = "\(T.self)"
        return services[key] as! T
    }
}
