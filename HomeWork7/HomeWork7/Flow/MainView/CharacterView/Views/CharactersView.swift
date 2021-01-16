//
//  CharactersView.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct CharactersView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: CharactersViewModel

    // MARK: - Body
    var body: some View {
        List() {
            ForEach(viewModel.characters, id: \.id) { character in
                NavigationLink(destination: CharacterDetail(character: character)) {
                    CharacterCell(character: character)
                }
                .listRowBackground(Color.white)
            } // ForEach
        } // List
    } // Body
}
