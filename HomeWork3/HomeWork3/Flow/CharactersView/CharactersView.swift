//
//  CharactersView.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import UIComponents

struct CharactersView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: CharactersViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(self.viewModel.state.characters) { character in
                UICharacterCell(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterCreated: character.created,
                    characterType: character.type,
                    characterImage: character.image,
                    characterOrigin: character.origin.name,
                    characterLocation: character.origin.name)
                        .onAppear {
                            if self.viewModel.state.characters.isLastItem(character) {
                                self.viewModel.fetchCharacters()
                            }
                } // UICharacterCell
            } // ForEach

            if self.viewModel.state.canLoadNextPage {
                HStack {
                    Spacer() 
                    Text("Loading...").padding()
                    Spacer()
                } // HStack
            }
        } // List
    } // Body
}
