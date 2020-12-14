//
//  TopNewsDetailView.swift
//  TViOSApp
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork
import SDWebImageSwiftUI

struct TopNewsDetailView: View {

    // MARK: - Properteis
    let article: Article

    // MARK: - Body
    var body: some View {
        ScrollView {
            articleView(picHeight: 600)
                .padding(.top, 90)
        } // ScrollView
        .edgesIgnoringSafeArea(.all)
    } // Body

    // MARK: - Configure UI
    func articleView(picHeight: CGFloat) -> some View {
        VStack {
            VStack {
                Text(article.title)
                    .font(Font.largeTitle.weight(.semibold))
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
    }
}
