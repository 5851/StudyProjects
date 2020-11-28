//
//  CharacterDB.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift
import rick_morty_swift_api

class CharacterDB: Object, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var species: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var gender: String = ""
    var location = List <CharacterRealmLocationModel>()
    var origin = List <CharacterRealmOriginModel>()
    @objc dynamic var image: String = ""
    var episode = List<String>()
    @objc dynamic var url: String = ""
    @objc dynamic var created: String = ""

    convenience init(_ character: CharacterModel) {
        self.init()
        self.id = character.id
        self.name = character.name
        self.status = character.status
        self.species = character.species
        self.type = character.type
        self.gender = character.gender
        self.image = character.image
        self.url = character.url
        self.created = character.created

        self.episode.append(objectsIn: character.episode)
        self.location.append(CharacterRealmLocationModel(location: character.location))
        self.origin.append(CharacterRealmOriginModel(origin: character.origin))
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

class CharacterRealmLocationModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    let owners = LinkingObjects(fromType: CharacterDB.self, property: "location")

    convenience init(location: CharacterLocationModel) {
        self.init()
        name = location.name
        url = location.url
    }

    override class func primaryKey() -> String? {
        return "name"
    }
}

class CharacterRealmOriginModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    var owner = LinkingObjects(fromType: CharacterDB.self, property: "origin")

    convenience init(origin: CharacterOriginModel) {
        self.init()
        name = origin.name
        url = origin.url
    }

    override class func primaryKey() -> String? {
        return "name"
    }
}
