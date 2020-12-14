//
//  ArticleListScreen.swift
//  NewsMulti
//
//  Created by exey on 03.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct ArticleListScreen: View {

    // MARK: - Properties
    @EnvironmentObject var articlesListVM: ArticlesListViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(articlesListVM.articles) { article in
                VStack(alignment: .leading) {
                    NavigationLink(destination: DescriptionView(news: article), label: {
                        cell(article)
                    }) // Navigation Link
                    .onAppear {
                        onItemShowed(article)
                    }
                } // VStack
            } // ForEach
        } // List
    } // Body

    // MARK: - Configure UI
    private func cell(_ article: Article) -> some View {
        VStack {
            NewsCell(article: article)
            if articlesListVM.isNewPageLoading && articlesListVM.articles.isLastItem(article) {
                Divider()
                Text("Loading...")
            }
        } // VStack
    }

    // MARK: - Helpers functions
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if articlesListVM.articles.isLastItem(item) {
            articlesListVM.pageFetch()
        }
    }
}
