//
//  EpisodesDetail.swift
//  HomeWork7
//
//  Created by MAC on 25.12.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct EpisodeDetail: View {

    // MARk: - Properties
    let episode: EpisodeDB

    // MARK: - Body
    public var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name: " + episode.name)
                        .fontWeight(.bold)
                    Text("Air_date: " + episode.air_date)
                        .fontWeight(.bold)
                    Text("Id: \(episode.id)")
                        .fontWeight(.bold)
                    Text("Url: \n" + episode.url)
                        .fontWeight(.bold)
                    Text("Created: \n" + episode.created)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 30)

            Spacer()
        } // ScrollView
    } // Body
}
