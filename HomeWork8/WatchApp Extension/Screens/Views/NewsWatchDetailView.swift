//
//  NewsWatchDetail.swift
//  WatchApp Extension
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork
import SDWebImageSwiftUI

struct NewsWatchDetailView: View {

    // MARK: - Properties
    let article: Article

    // MARK: - Body
    var body: some View {
        ScrollView {
            articleView(picHeight: 50)
                .padding(.top, 90)
        } // ScrollView
        .edgesIgnoringSafeArea(.all)
    } // Boyd

    // MARK: - Configure UI
    func articleView(picHeight: CGFloat) -> some View {
        VStack {
            VStack {
                Text(article.title)
                    .font(.caption)
                    .fontWeight(.bold)

                Spacer().frame(height: 20)
            } // VStack
            .padding(.horizontal, 20)

            VStack {
                WebImage(url: URL(string: article.urlToImage ?? "https://newsapi.org")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: picHeight)
                    .clipped()
            } // VStack

            VStack {
                Spacer().frame(height: 20)
                Text(article.description ?? "")
            } // VStack
            .padding(.horizontal, 20)

            Spacer().frame(height: 200)
            Spacer()
        } // VStack
    } // articleView
}
