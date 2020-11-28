//
//  EpisodesViewModel.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

final class EpisodesViewModel: ObservableObject {

    // MARK: - Struct
    struct State {
        var episodes: [EpisodeModel] = []
        var pageNumber: Int = 1
        var canLoadNextPage = false
    }

    // MARK: - Properties
    @Published private(set) var state = State()
    let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
        self.fetchEpisodes()
    }

    // MARK: - NetworkFunctions
    func fetchEpisodes() {
        guard state.canLoadNextPage == false else {
            return
        }
        self.state.pageNumber += 1
        self.state.canLoadNextPage = true

        let episodes: EpisodesProtocol = serviceLocator.getService()

        episodes.getEpisodesByPageNumber(pageNumber: state.pageNumber) { (results) in
            switch results {
            case.success(let characters):
                DispatchQueue.main.async {
                    self.state.episodes.append(contentsOf: characters)
                    self.state.canLoadNextPage = false
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
