//
//  EpisodesView.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import UIComponents

struct EpisodesView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: EpisodesViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(self.viewModel.state.episodes) { episode in
                UIEpisodeCell(
                    episodeName: episode.name,
                    episodeAirDate: episode.airDate,
                    episodeNumber: episode.episode,
                    episodeURL: episode.url)
                        .onAppear {
                            if self.viewModel.state.episodes.isLastItem(episode) {
                                self.viewModel.fetchEpisodes()
                            }
                } // UIEpisodeCell
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
