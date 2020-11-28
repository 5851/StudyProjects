//
//  EpisodeCell.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import rick_morty_swift_api

struct EpisodeCell: View {

    // MARk: - Properties
    let episode: EpisodeDB

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: " + episode.name)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Air Date: " + episode.air_date)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Episode: " + episode.episode)
                    Text("URL: " + episode.url)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
        } // VStack
    } // Body
}
