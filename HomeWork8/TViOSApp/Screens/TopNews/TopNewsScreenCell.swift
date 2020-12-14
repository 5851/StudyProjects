//
//  TopNewsScreenCell.swift
//  TViOSApp
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct TopNewsScreenCell: View {

    // MARK: - Properties
    var article: Article

    // MARK: - Body
    var body: some View {
        NavigationLink(destination: LazyView { TopNewsDetailView(article: article) }) {
            Text(article.title)
        } // NavigationLink
    }
}
