//
//  EpisodesFactory.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol EpisodesProtocol {
    func getEpisodesByPageNumber(pageNumber: Int, completion: @escaping (Result<[EpisodeModel], Error>) -> Void)
}

class EpisodesFactory: EpisodesProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getEpisodesByPageNumber(pageNumber: Int, completion: @escaping (Result<[EpisodeModel], Error>) -> Void) {
        client.episode().getEpisodesByPageNumber(pageNumber: pageNumber, completion: completion)
    }
}
