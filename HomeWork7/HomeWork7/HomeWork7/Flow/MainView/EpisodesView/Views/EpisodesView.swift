//
//  EpisodesView.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct EpisodesView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: EpisodesViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.episodes, id: \.id) { episode in
                EpisodeCell(episode: episode)
            } // ForEach
        } // List
    } // Body
}
