//
//  LocationsViewModel.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

final class LocationsViewModel: ObservableObject {

    // MARK: - Struct
    struct State {
        var locations: [LocationModel] = []
        var pageNumber: Int = 1
        var canLoadNextPage = false
    }

    // MARK: - Properties
    @Published private(set) var state = State()
    let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
        self.fetchLocations()
    }

    // MARK: - NetworkFunctions
    func fetchLocations() {
        guard state.canLoadNextPage == false else {
            return
        }
        self.state.pageNumber += 1
        self.state.canLoadNextPage = true

        let locations: LocationsProtocol = serviceLocator.getService()

        locations.getLocationsByPageNumber(pageNumber: state.pageNumber) { (results) in
            switch results {
            case.success(let locations):
                DispatchQueue.main.async {
                    self.state.locations.append(contentsOf: locations)
                    self.state.canLoadNextPage = false
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}


