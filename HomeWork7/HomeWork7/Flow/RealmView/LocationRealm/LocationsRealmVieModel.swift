//
//  LocationsVieModel.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift

final class LocationsRealmVieModel: ObservableObject {

    // MARK: - Struct
    var locations: Results<LocationDB>
//
    init(realm: Realm) {
        locations = realm.objects(LocationDB.self)
    }
}
