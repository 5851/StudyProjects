//
//  RealmService.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    func saveLocations(items: [LocationDB])
    func saveEpisodes(items: [EpisodeDB])
    func saveCharacters(items: [CharacterDB])
}

class RealmService: RealmServiceProtocol {

    let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

    func saveLocations(items: [LocationDB]) {
        let realm = try? Realm(configuration: deleteIfMigration)
        print(realm?.configuration.fileURL ?? "URL do not find")
        try? realm?.write {
            realm?.add(items, update: .modified)
        }
    }

    func saveEpisodes(items: [EpisodeDB]) {
        let realm = try? Realm(configuration: deleteIfMigration)
        print(realm?.configuration.fileURL ?? "URL do not find")
        try? realm?.write {
            realm?.add(items, update: .modified)
        }
    }

    func saveCharacters(items: [CharacterDB]) {
        let realm = try? Realm(configuration: deleteIfMigration)
        print(realm?.configuration.fileURL ?? "URL do not find")
        try? realm?.write {
            realm?.add(items, update: .modified)
        }
    }
}
