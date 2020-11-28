//
//  CharacterRealmCell.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterRealmCell: View {

    // MARk: - Properties
    let character: CharacterDB

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    WebImage(url: URL(string: character.image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .cornerRadius(50)

                    VStack(alignment: .leading) {
                        Text("Name: " + character.name)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Status: " + character.status)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Name origin: \(character.origin.first?.name ?? "")")
                    Text("Name location: \(character.location.first?.name ?? "")")
                    Text(character.created)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
        } // VStack
    } // Body
}
