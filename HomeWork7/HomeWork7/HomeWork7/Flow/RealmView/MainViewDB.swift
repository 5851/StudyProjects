//
//  MainViewDB.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct MainViewRealm: View {

    // MARK: - Properties
    @State private var selectorIndex = 0

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
                CharactersRealmView()
            }
            if selectorIndex == 1 {
                LocationsViewRealm()
            }
            if selectorIndex == 2 {
                EmptyView()
            }
        }
    }
}
