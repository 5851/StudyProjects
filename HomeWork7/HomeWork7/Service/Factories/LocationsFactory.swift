//
//  LocationsFactory.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol LocationsProtocol {
    func getAllLocations(completion: @escaping (Result<[LocationModel], Error>) -> Void)
}

class LocationsFactory: LocationsProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getAllLocations(completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        client.location().getAllLocations(completion: completion)
    }
}
