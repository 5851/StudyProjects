//
//  TopNewsView.swift
//  TViOSApp
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct TopNewsView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: TopNewsViewModel

    // MARK: - Body
    var body: some View {
        VStack {
            Form {
                Section(header:
                    Text("Топ новости").font(.custom("", size: 24)).bold()
                ) {
                    List {
                        ForEach(viewModel.state.news) { item in
                            VStack(alignment: .leading) {
                                cell(item)
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

    // MARK: - Configure UI
    private func cell(_ article: Article) -> some View {
        VStack {
            TopNewsScreenCell(article: article)
            if viewModel.state.canLoadNextPage && viewModel.state.news.isLastItem(article) {
                Divider()
                Text("Loading...")
            }
        }
    }

    // MARK: - Helpers functions
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if viewModel.state.news.isLastItem(item) {
            viewModel.fetchTopNews()
        }
    }
}
