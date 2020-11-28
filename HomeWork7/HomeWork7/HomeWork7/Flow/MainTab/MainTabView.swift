//
//  MainTabView.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct MainTabView: View {

    // MARK: - Properties
    @State var indexButton: Int = 0

    // MARK: - Body
    var body: some View {
        VStack() {
            if self.indexButton == 0 {
                MainView()
            } else if self.indexButton == 1 {
                EmptyView()
            } else {
                EmptyView()
            }
            Spacer()
            CustomTabs(indexButton: $indexButton)
        }
        .navigationBarTitle("Информация", displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    } // Body
}

