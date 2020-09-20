//
//  MainView.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct MainView: View {

    // MARK: - Properties
    @State var indexButton: Int = 1

    // MARK: - Init
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            HStack {
                VStack(spacing: 15) {
                    // Button 1
                    Button(action: {
                    }) {
                        Image("menu")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

                    Group {
                        // Button 1
                        Button(action: {
                            self.indexButton = 1
                        }) {
                            VStack {
                                Text("Новости")
                                    .frame(width: 120, height: 35)
                                    .foregroundColor(self.indexButton == 1 ? Color.white : Color.black)
                            }
                            .background(Color.orange.opacity(self.indexButton == 1 ? 1 : 0))
                            .clipShape(ShapeForButton())
                        }
                        .rotationEffect(.init(degrees: -90))
                        .padding(.top, 80)

                        Spacer(minLength: 0)

                        // Button 2
                        Button(action: {
                            self.indexButton = 2
                        }) {
                            VStack {
                                Text("Погода")
                                    .frame(width: 120, height: 35)
                                    .foregroundColor(self.indexButton == 2 ? Color.white : Color.black)
                            }
                            .background(Color.orange.opacity(self.indexButton == 2 ? 1 : 0))
                            .clipShape(ShapeForButton())
                        }
                        .rotationEffect(.init(degrees: -90))
                    } // Group

                    Spacer()
                    Spacer()
                    Spacer()
                } // VStack
                    .padding(.vertical)
                    .frame(width: 65)
                    .background(Color.black.opacity(0.1))
                    .clipShape(ShapeForButton())

                GeometryReader { _ in
                    VStack {
                        if self.indexButton == 1 {
                            NewsView()
                        }
                        else if self.indexButton == 2 {
                            EmptyView()
                        }
                        else {
                            EmptyView()
                        }
                    }
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                } // GeometryReader
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } // NavControllerView
    } // Body
}
