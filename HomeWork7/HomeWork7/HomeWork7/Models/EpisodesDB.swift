//
//  EpisodesDB.swift
//  HomeWork7
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift
import rick_morty_swift_api

class EpisodeDB: Object, Identifiable {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var air_date: String = ""
    @objc dynamic var episode: String = ""
    var characters = List<String>()
    @objc dynamic var url: String = ""
    @objc dynamic var created: String = ""

    convenience init(_ episode: EpisodeModel) {
        self.init()
        self.id = episode.id
        self.name = episode.name
        self.air_date = episode.airDate
        self.episode = episode.episode
        self.url = episode.url
        self.created = episode.created
        self.characters.append(objectsIn: episode.characters)
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}
