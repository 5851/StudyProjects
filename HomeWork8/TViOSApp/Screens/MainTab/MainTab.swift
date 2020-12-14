//
//  MainTab.swift
//  TViOSApp
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI

struct MainTab: View {

    // MARK: - Properties
    @State private var selection = 0

    // MARK: - Body
    var body: some View {
        setupTabView()
    }

    // MARK: - Setup UI
    private func setupTabView() -> some View {
        NavigationView {
            VStack {
                TabView(selection: $selection) {
                    AppleNewsView().tabItem {
                        Text("News Apple")
                    }.tag(1)
                    TopNewsView().tabItem {
                        Text("Тop News")
                    }.tag(2)
                } // TabView
                Spacer()
            } // VStack
        } // NavigationView
    }
}
