//
//  CharactersFactory.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol CharactersProtocol {
    func getCharactersByPageNumber(pageNumber: Int, completion: @escaping (Result<[CharacterModel], Error>) -> Void)
}

class CharactersFactory: CharactersProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getCharactersByPageNumber(pageNumber: Int, completion: @escaping (Result<[CharacterModel], Error>) -> Void) {
        client.character().getCharactersByPageNumber(pageNumber: pageNumber, completion: completion)
    }
}
