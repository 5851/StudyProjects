//
//  ContentView.swift
//  OtusProject
//
//  Created by MAC on 28.08.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct MainView: View {

    // MARK: - Properties
    @State var selection: Int = 0
    @State var indexRow: Int?

    // MARK: - Init
    init() {
        UITableView.appearance().separatorStyle = .none
    }

    // MARK: - Body
    var body: some View {
        TabView(selection: $selection) {
            FirstView(selection: $selection,
                      indexRow: $indexRow)
                .tabItem({
                    VStack {
                        Text("FirstView")
                        Image(systemName: "bolt.circle")
                    }
                })
                .tag(0)
            SecondView(indexRow: $indexRow)
                .tabItem({
                    VStack {
                        Text("SecondView")
                        Image(systemName: "car")
                    }
                })
                .tag(1)
            ThirdView()
                .tabItem({
                    VStack {
                        Text("ThirdView")
                        Image(systemName: "book.circle")
                    }
                })
                .tag(2)
        } // TabView
    } // Body
}

struct MainView_Previews: PreviewProvider {

    // MARK: - Previews
    static var previews: some View {
        MainView()
    }
}
