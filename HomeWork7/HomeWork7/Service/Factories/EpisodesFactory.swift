//
//  EpisodesFactory.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol EpisodesProtocol {
    func getAllEpisodes(completion: @escaping (Result<[EpisodeModel], Error>) -> Void)
}

class EpisodesFactory: EpisodesProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getAllEpisodes(completion: @escaping (Result<[EpisodeModel], Error>) -> Void) {
        client.episode().getAllEpisodes(completion: completion)
    }
}
