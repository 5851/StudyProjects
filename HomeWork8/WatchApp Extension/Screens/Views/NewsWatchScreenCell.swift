//
//  WatchScreenDetail.swift
//  WatchApp Extension
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork

struct NewsWatchScreenCell: View {

    // MARK: - Properties
    var article: Article

    // MARK: - Body
    var body: some View {
        NavigationLink(destination: LazyView {
            NewsWatchDetailView(article: article)
        }) {
            Text(article.title)
        } // NavigationLink
    } // Body
}
