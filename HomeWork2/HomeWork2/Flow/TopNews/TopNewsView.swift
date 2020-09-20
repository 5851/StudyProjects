//
//  TopNewsView.swift
//  HomeWork2
//
//  Created by MAC on 20.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct TopNewsView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: TopNewsViewModel
    @State var typeCategoryIndex = 0
    @State var typeLangIndex = 0

    // MARK: - Body
    var body: some View {
        VStack {
            Form {

                // Section 1
                Section {
                    Picker("Категории", selection: $typeCategoryIndex) {
                        ForEach(0..<viewModel.state.newsCategoryType.count) { index in
                            Text(self.viewModel.state.newsCategoryType[index]).tag(index)
                        }
                    } // Picker
                    Picker("Выбрать язык", selection: $typeLangIndex) {
                        ForEach(0..<viewModel.state.langCategoryType.count) { (index) in
                            Text(self.viewModel.state.langCategoryType[index]).tag(index)
                        }
                    } // Picker
                }
                .onReceive([self.typeCategoryIndex].publisher.first()) { (value) in
                    self.viewModel.setSource(index: value)
                }
                .onReceive([self.typeLangIndex].publisher.first()) { (value) in
                    self.viewModel.setLanguage(index: value)
                } // Section № 1

                // Section 2
                Section(header:
                    Text("Топ новости").font(.custom("", size: 24)).bold()
                ) {
                    List {
                        ForEach(viewModel.state.news) { item in
                            VStack(alignment: .leading) {
                                NewsCell(article: item)
                                    .onAppear {
                                        if self.viewModel.state.news.isLastItem(item) {
                                            self.viewModel.fetchTopNews()
                                        }
                                }
                            } // VStack
                        } // ForEach

                        if viewModel.state.canLoadNextPage {
                            HStack {
                                Spacer()
                                Text("Loading...").padding()
                                Spacer()
                            }
                        }
                    } // List
                } // Section № 2
            } // Form
        } // VStack
    } // Body
}
