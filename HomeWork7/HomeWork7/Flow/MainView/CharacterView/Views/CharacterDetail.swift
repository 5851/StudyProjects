//
//  CharacterView.swift
//  HomeWork7
//
//  Created by MAC on 25.12.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetail: View {

    // MARk: - Properties
    @EnvironmentObject var viewModel: CharactersViewModel
    let character: CharacterDB

    // MARK: - Body
    public var body: some View {
        ScrollView {

            VStack {
                WebImage(url: URL(string: character.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            }

            HStack {
                VStack(alignment: .leading) {
                    Text("Name: " + character.name)
                        .fontWeight(.bold)
                    Text("Status: " + character.status)
                        .fontWeight(.bold)
                    Text("Id: \(character.id)")
                        .fontWeight(.bold)
                    Text("Species: " + character.species)
                        .fontWeight(.bold)
                    Text("Type: " + character.type)
                        .fontWeight(.bold)
                    Text("Gender: " + character.gender)
                        .fontWeight(.bold)
                    Text("Url: \n" + character.url)
                        .fontWeight(.bold)
                    Text("Created: \n" + character.created)
                        .fontWeight(.bold)
                }

                Spacer()
            }
            .padding([.leading, .trailing], 30)
        } // ScrollView
    } // Body
}
