//
//  NewsView.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct NewsView: View {

    // MARK: - Properties
    @State var indexButton = 0
    @EnvironmentObject var viewModel: NewsViewModel

    // MARK: - Body
    var body: some View {
        NavControllerView(transition: .custom(.fadeAndMove, .moveAndFade)) {
            VStack {
                HStack {
                    Text("News")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                } // HStack

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        // Button 1
                        Button(action: {
                            self.indexButton = 0
                        }) {
                            Text("Все новости")
                                .fontWeight(self.indexButton == 0 ? .bold : .light)
                                .foregroundColor(self.indexButton == 0 ? Color.white : Color.black)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 12)
                        }
                        .background(self.indexButton == 0 ? Color.orange : Color.clear)
                        .clipShape(ShapeForButton())

                        // Button 2
                        Button(action: {
                            self.indexButton = 1
                        }) {
                            Text("Топовые новости")
                                .fontWeight(self.indexButton == 1 ? .bold : .light)
                                .foregroundColor(self.indexButton == 1 ? Color.white : Color.black)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 12)
                        }
                        .background(self.indexButton == 1 ? Color.orange : Color.clear)
                        .clipShape(ShapeForButton())

                        // Button 3
                        Button(action: {
                            self.indexButton = 2
                        }) {
                            Text("Новости от источника")
                                .fontWeight(self.indexButton == 2 ? .bold : .light)
                                .foregroundColor(self.indexButton == 2 ? Color.white : Color.black)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 12)
                        }
                        .background(self.indexButton == 2 ? Color.orange : Color.clear)
                        .clipShape(ShapeForButton())
                    } // HStack
                    .animation(.spring())
                } // ScrollView


                if self.indexButton == 0 {
                    EveryThingNews()
                } else if self.indexButton == 1 {
                    TopNewsView()
                } else if self.indexButton == 2 {
                    EmptyView()
                } else  {
                    Color(.blue)
                }

                Spacer()
            } // VStack
            .padding()
        } // NavControllerView
    } // Body
}
