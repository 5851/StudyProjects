//
//  ContentView.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import rick_morty_swift_api

struct MainView: View {

    // MARK: - Properties
    @State private var selectorIndex = 0

    // MARK: - Init
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }

    // MARK: - Body
    var body: some View {
        VStack {
            Picker("Lists", selection: $selectorIndex) {
                Text("Characters").tag(0)
                Text("Locations").tag(1)
                Text("Episodes").tag(2)
            }.pickerStyle(SegmentedPickerStyle())

            Spacer()
            
            if selectorIndex == 0 {
                CharactersView()
            }
            if selectorIndex == 1 {
                LocationsView()
            }
            if selectorIndex == 2 {
                EpisodesView()
            }
        }
    }
}
