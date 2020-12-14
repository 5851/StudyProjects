//
//  1111.swift
//  HomeWork8
//
//  Created by MAC on 13.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct ArticleListScreenCell: View {

    // MARK: - Properties
    var article: Article

    // MARK: - Body
    var body: some View {
        NavigationLink(destination: LazyView {
            ArticleDetailScreen(article: article)
        }) {
            Text(article.title)
        } // NavigationLink
    } // body
}
