//
//  EpisodesViewModel.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api
import RealmSwift

final class EpisodesViewModel: ObservableObject {

    // MARK: - Properties
    var episodes: Results<EpisodeDB>
    let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator, realm: Realm) {
        episodes = realm.objects(EpisodeDB.self)
        self.serviceLocator = serviceLocator
        self.fetchEpisodes()
    }

    // MARK: - NetworkFunctions
    func fetchEpisodes() {
        let episodes: EpisodesProtocol = serviceLocator.getService()
        let realmService: RealmServiceProtocol = serviceLocator.getService()

        episodes.getAllEpisodes { (results) in
            switch results {
            case.success(let episodes):
                DispatchQueue.main.async {
                    let episodesDB = episodes.map { EpisodeDB.init($0) }
                    realmService.saveEpisodes(items: episodesDB)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
