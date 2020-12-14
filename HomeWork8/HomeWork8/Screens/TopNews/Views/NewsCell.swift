//
//  NewsCell.swift
//  HomeWork8
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork
import SDWebImageSwiftUI

struct NewsCell: View {

    // MARk: - Properties
    let article: Article

    // MARK: - Body
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading) {

                    if article.urlToImage != nil {
                        WebImage(url: URL(string: article.urlToImage ?? ""))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .cornerRadius(10)
                    }

                    VStack(alignment: .leading) {
                        Text(article.author ?? "Неизвестный автор")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text(article.publishedAt ?? "Дата неизвеста")
                    } // VStack
                    .padding(.vertical)

                    HStack {
                        Text(article.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        Spacer()
                    } // HStack
                    Text(article.description ?? "Отсутствует описание")
                        .lineLimit(2)
                } // VStack
                    .padding()
            } // VStack
        } // VStack
    } // Body
}
