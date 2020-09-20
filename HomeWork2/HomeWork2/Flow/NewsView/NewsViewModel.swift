//
//  NewsViewModel.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import Combine
import OpenAPIClient

final class NewsViewModel: ObservableObject {

    // MARK: - Struct
    struct State {
        var news: [Article] = []
        var pageNews: Int = 1
        var canLoadNextPage = false
    }

    // MARK: - Properties
    @Published private(set) var state = State()

    init() {
        self.fetchEveryThingNews()
    }

    // MARK: - NetworkFunctions
    func fetchEveryThingNews() {
        guard self.state.canLoadNextPage == false else {
            return
        }
        self.state.pageNews += 1
        self.state.canLoadNextPage = true

        ArticlesAPI.everythingGet(q: "Apple", from: Date().currentDate(), sortBy: "publishedAt", apiKey: "9fdee62ae85e49fd8e1aadd66205cb6c", page: state.pageNews) { (list, error) in
            self.state.canLoadNextPage = false

            if let list = list, let results = list.articles {
                self.state.news.append(contentsOf: results)
            } else {
                print(error ?? "Error")
            }
        }
    }
}
