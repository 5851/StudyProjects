//
//  AppleNewsView.swift
//  TViOSApp
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct AppleNewsView: View {

    // MARK: - Properties
    @ObservedObject var viewModel = ArticlesListViewModel()

    // MARK: - Body
    var body: some View {
        VStack {
            List(viewModel.articles) { article in
                cell(article)
                    .onAppear {
                        onItemShowed(article)
                    }
            } // List
        } // VStack
    } // Body

    // MARK: - Configure UI
    private func cell(_ article: Article) -> some View {
        VStack {
            TopNewsScreenCell(article: article)
            if viewModel.isNewPageLoading && viewModel.articles.isLastItem(article) {
                Divider()
                Text("Loading...")
            }
        } // VStack
    }

    // MARK: - Helpers functions
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if viewModel.articles.isLastItem(item) {
            viewModel.pageFetch()
        }
    }
}
