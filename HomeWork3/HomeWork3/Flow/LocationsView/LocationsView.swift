//
//  LocationsView.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import UIComponents
import rick_morty_swift_api

struct LocationsView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: LocationsViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(self.viewModel.state.locations) { location in
                UILocationCell(
                    locationName: location.name,
                    locationType: location.type,
                    locationDimension: location.dimension,
                    locationURL: "\(location.id)")
                        .onAppear {
                            if self.viewModel.state.locations.isLastItem(location) {
                                self.viewModel.fetchLocations()
                            }
                } // UILocationCell
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
