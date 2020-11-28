//
//  CharactersRealmViewModel.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

final class CharactersRealmViewModel: ObservableObject {

    // MARK: - Struct
    var characters: Results<CharacterDB>

    init(realm: Realm) {
        characters = realm.objects(CharacterDB.self)
    }

    private func deleteRow(with indexSet: IndexSet) {
        objectWillChange.send()

//        let realm = try? Realm()
//        indexSet.forEach ({ index in
//            try! realm?.write {
//                realm?.delete(self.viewModel.characters[index])
//            }
//        })
//        self.viewModel.characters = realm?.objects(CharacterDB.self) as! Results<CharacterDB>
    }
}
