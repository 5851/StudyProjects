//
//  NewsWatchView.swift
//  WatchApp Extension
//
//  Created by MAC on 13.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct NewsWatchView: View {

    // MARK: - Properties
    @ObservedObject var viewModel = TopNewsViewModel()

    // MARK: - Body
    var body: some View {
        VStack {
            List(viewModel.state.news) { article in
                cell(article)
                    .onAppear {
                        onItemShowed(article)
                    }
            } // List
        } // VStack
    } // Body

    // MARK: - Condigure Cell
    private func cell(_ article: Article) -> some View {
        VStack {
            NewsWatchScreenCell(article: article)
            if viewModel.state.canLoadNextPage && viewModel.state.news.isLastItem(article) {
                Divider()
                Text("Loading...")
            }
        } // VStack
    }

    // MARK: - Helpers functinos
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if viewModel.state.news.isLastItem(item) {
            viewModel.fetchTopNews()
        }
    }
}
