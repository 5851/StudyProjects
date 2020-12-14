//
//  MainTabVIew.swift
//  HomeWork8
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI

struct NewsView: View {

    // MARK: - Properties
    @State var indexButton = 0

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
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
                    } // HStack
                    .animation(.spring())
                } // ScrollView


                if self.indexButton == 0 {
                    ArticleListScreen()
                } else if self.indexButton == 1 {
                    TopNewsView()
                } else  {
                    Color(.blue)
                }

                Spacer()
            } // VStack
            .padding()

            .navigationBarTitle("News", displayMode: .inline)
        } // NavControllerView
    } // Body
}
