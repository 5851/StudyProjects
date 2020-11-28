//
//  LocationsView.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import rick_morty_swift_api

struct LocationsView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: LocationsViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.locations, id: \.id) { location in
                LocationCell(location: location)
            } // ForEach
        } // List
    } // Body
}
