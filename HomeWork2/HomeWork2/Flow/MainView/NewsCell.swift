//
//  EveryThingCell.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import OpenAPIClient
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
                        Text(article.title ?? "Отсутствует название")
                            .fontWeight(.bold)
                            .lineLimit(1)
                        Spacer()
                    } // HStack
                    Text(article.description ?? "Отсутствует описание")
                        .lineLimit(2)

                    VStack {
                        NavPushButton(destination: DescriptionView(news: article)) {
                            Text("Дополнительно")
                                .foregroundColor(Color.red)
                        } // NavPushButton
                        .padding(.top)
                    }
                } // VStack
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .clipShape(ShapeForButton())
            } // VStack
        } // VStack
    } // Body
}
