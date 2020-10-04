//
//  LoactionsFactory.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol LocationsProtocol {
    func getLocationsByPageNumber(pageNumber: Int, completion: @escaping (Result<[LocationModel], Error>) -> Void)
}

class LocationsFactory: LocationsProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getLocationsByPageNumber(pageNumber: Int, completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        client.location().getLocationsByPageNumber(pageNumber: pageNumber, completion: completion)
    }
}
