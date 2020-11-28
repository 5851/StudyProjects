//
//  LocationsVieModel.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api
import RealmSwift

final class LocationsViewModel: ObservableObject {

    // MARK: - Properties
    @Published var locations: Results<LocationDB>
    private let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator, realm: Realm) {
        locations = realm.objects(LocationDB.self)
        self.serviceLocator = serviceLocator
        fetchLocations()
    }

    // MARK: - NetworkFunctions
    func fetchLocations() {
        let locations: LocationsProtocol = serviceLocator.getService()
        let realmService: RealmServiceProtocol = serviceLocator.getService()

        locations.getAllLocations { (results) in
            switch results {
            case.success(let locations):
                DispatchQueue.main.async {
                    let locationsDB = locations.map { LocationDB.init($0) }
                    realmService.saveLocations(items: locationsDB)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
