//
//  CharactersViewModel.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import rick_morty_swift_api
import RealmSwift

final class CharactersViewModel: ObservableObject {

    // MARK: - Properties
    var characters: Results<CharacterDB>
    let serviceLocator: ServiceLocator

    // MARK: - Init
    init(serviceLocator: ServiceLocator, realm: Realm) {
        characters = realm.objects(CharacterDB.self)
        self.serviceLocator = serviceLocator
    }

    // MARK: - NetworkFunctions
    func fetchCharacters() {
        let characters: CharactersProtocol = serviceLocator.getService()
        let realmService: RealmServiceProtocol = serviceLocator.getService()

        characters.getAllCharacters { (results) in
            switch results {
            case.success(let characters):
                DispatchQueue.main.async {
                    let charactersDB = characters.map { CharacterDB.init($0) }
                    realmService.saveCharacters(items: charactersDB)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
