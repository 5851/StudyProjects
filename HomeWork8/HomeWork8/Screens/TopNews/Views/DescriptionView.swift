//
//  DescriptionView.swift
//  HomeWork8
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork
import SDWebImageSwiftUI

struct DescriptionView: View {

    // MARK: - Properties
    var news: Article
    @State private var isPresneted: Bool = false

    // MARK: - Body
    var body: some View {

        ZStack {
            ScrollView {
                if self.news.urlToImage != nil {
                    GeometryReader { geometry in

                        VStack {
                            if geometry.frame(in: .global).minY <= 0 {
                                WebImage(url: URL(string: self.news.urlToImage ?? ""))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .offset(y: geometry.frame(in: .global).minY/9)
                                    .clipped()
                            } else {
                                WebImage(url: URL(string: self.news.urlToImage ?? ""))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                            }
                        } // VStack
                    } // GeometryReader
                    .frame(height: 200)
                    .padding(.top, 40)
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Истоник")
                            .fontWeight(.bold)
                        Text(news.source?.name ?? "Источник неизвестне")
                    }
                    .padding(.leading)
                    .padding(.top, self.news.urlToImage == nil ? 100 : 20)

                    Spacer()
                } // HStack

                HStack {
                    VStack(alignment: .leading) {
                        Text("Автор")
                            .fontWeight(.bold)
                        Text(news.author ?? "Автор неизвестен")
                    }
                    .padding()

                    Spacer()
                } // HStack

                HStack {
                    VStack(alignment: .leading) {
                        Text("Новость")
                            .fontWeight(.bold)
                        Text(news.description ?? "Отсутствует описание")
                    }
                    .padding()

                    Spacer()
                } // HStack

                HStack {
                    VStack(alignment: .leading) {
                        Text("Дата публикации")
                            .fontWeight(.bold)
                        Text(news.publishedAt ?? "Дата публикации отсутствует")
                    }
                    .padding()

                    Spacer()
                } // HStack

                HStack {
                    VStack(alignment: .leading) {
                        Text("Контент")
                            .fontWeight(.bold)
                        Text(news.content ?? "Контент отсутствует")
                    }
                    .padding()

                    Spacer()
                } // HStack
            } // ScrollView

            .navigationBarTitle("\(news.title)", displayMode: .inline)
        } // ZStack
        .edgesIgnoringSafeArea(.top)
    } // Body
}
