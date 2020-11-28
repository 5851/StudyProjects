//
//  CharactersFactory.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api

protocol CharactersProtocol {
    func getAllCharacters(completion: @escaping (Result<[CharacterModel], Error>) -> Void)
}

class CharactersFactory: CharactersProtocol {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getAllCharacters(completion: @escaping (Result<[CharacterModel], Error>) -> Void) {
        client.character().getAllCharacters(completion: completion)
    }
}
