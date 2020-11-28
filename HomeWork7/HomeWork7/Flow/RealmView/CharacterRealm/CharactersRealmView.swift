//
//  CharactersRealmView.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import RealmSwift
import Combine

struct CharactersRealmView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: CharactersRealmViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(self.viewModel.characters) { character in
                CharacterRealmCell(character: character)
            }.onDelete { (indexSet) in
//                self.deleteRow(with: indexSet)
            }
        } // ForEach
    } // Body
}
