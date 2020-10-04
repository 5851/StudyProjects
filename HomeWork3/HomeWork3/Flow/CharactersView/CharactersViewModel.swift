//
//  CharactersViewModel.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api
import Combine

final class CharactersViewModel: ObservableObject {

    // MARK: - Struct
    struct State {
        var characters: [CharacterModel] = []
        var pageNumber: Int = 1
        var canLoadNextPage = false
    }

    // MARK: - Properties
    @Published private(set) var state = State()
    let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
        self.fetchCharacters()
    }

    // MARK: - NetworkFunctions
    func fetchCharacters() {
        guard state.canLoadNextPage == false else {
            return
        }
        self.state.pageNumber += 1
        self.state.canLoadNextPage = true

        let characters: CharactersProtocol = serviceLocator.getService()

        characters.getCharactersByPageNumber(pageNumber: state.pageNumber) { (results) in
            switch results {
            case.success(let characters):
                DispatchQueue.main.async {
                    self.state.characters.append(contentsOf: characters)
                    self.state.canLoadNextPage = false
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}

