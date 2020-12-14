//
//  TopNewsViewModel.swift
//  HomeWork8
//
//  Created by MAC on 14.12.2020.
//

import SwiftUI
import NewsAPINetwork

final class TopNewsViewModel: ObservableObject {

    // MARK: - Struct
    struct State {
        var news: [Article] = []
        var pageNewsIndex: Int = 1
        var canLoadNextPage = false

        var newsCategoryType = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
        var typeNewsCategoryIndex = 0

        var langCategoryType = ["ru", "us"]
        var typeLangCategoryIndex = 0
    }

    // MARK: - Properties
    @Published private(set) var state = State()

    // MARK: - Init
    init() {
        self.fetchTopNews()
    }

    // MARK: - NetworkFunctions
    func setLanguage(index: Int) {
        guard index >= 0, index != self.state.typeLangCategoryIndex else { return }
        self.state.typeLangCategoryIndex = index
        self.state.pageNewsIndex = 0
        self.state.news = [Article]()
        self.fetchTopNews()
    }

    func setSource(index: Int) {
        guard index >= 0, index != self.state.typeNewsCategoryIndex else { return }
        self.state.typeNewsCategoryIndex = index
        self.state.pageNewsIndex = 0
        self.state.news = [Article]()
        self.fetchTopNews()
    }

    func fetchTopNews() {
        guard state.canLoadNextPage == false else {
            return
        }
        self.state.pageNewsIndex += 1
        self.state.canLoadNextPage = true

        ArticlesAPI.topNewsGet(country: state.langCategoryType[state.typeLangCategoryIndex],
                               category: state.newsCategoryType[state.typeNewsCategoryIndex],
                               apiKey: "9fdee62ae85e49fd8e1aadd66205cb6c") { (list, error) in

            self.state.canLoadNextPage = false

            if let list = list, let results = list.articles {
                self.state.news.append(contentsOf: results)
            } else {
                print(error ?? "Error")
            }
        }
    }
}
