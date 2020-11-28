//
//  LocationDB.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift
import rick_morty_swift_api

class LocationDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var dimension: String = ""
    var residents = List<String>()
    @objc dynamic var url: String = ""
    @objc dynamic var created: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}

extension LocationDB {
    convenience init(_ location: LocationModel) {
        self.init()
        self.id = location.id
        self.name = location.name
        self.type = location.type
        self.dimension = location.dimension
        self.url = location.url
        self.created = location.created

        self.residents.append(objectsIn: location.residents)
    }
}
