//
//  StartView.swift
//  HomeWork7
//
//  Created by MAC on 28.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct StartView: View {

    @EnvironmentObject var viewModel: CharactersViewModel

    // MARK: - Init
    init() {
        configureNavigationBar()
        configureUITableViewBar()
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea([.all])
                NavigationLink(destination: MainTabView()) {
                    Text("Show HomeWork7")
                }
            }
            .navigationBarTitle("HomeWork № 7", displayMode: .inline)
        }
        .onAppear {
            /// Чтобы при первом запуске сразу показало
            /// объекты сохраненные в первый раз
//            self.viewModel.fetchCharacters()
        }
    }

    // MARK: - Helpers functions
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }

    private func configureUITableViewBar() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
}
