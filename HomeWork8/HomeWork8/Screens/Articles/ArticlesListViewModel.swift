//
//  ArticlesListViewModel.swift
//  NewsMulti
//
//  Created by exey on 03.12.2020.
//

import Combine
import NewsAPINetwork

final class ArticlesListViewModel: ObservableObject {

    // MARK: - Properties
    @Published private(set) var articles = [Article]()
    @Published var pageIndex: Int = 0
    @Published var isNewPageLoading = false

    // MARK: - Init
    init() {
        pageFetch()
    }

    // MARK: - Network functions
    func pageFetch() {
        guard isNewPageLoading == false else {
            return
        }
        
        isNewPageLoading = true
        pageIndex += 1
        
        ArticlesAPI.everythingGet(q: "Apple M1",
                                  from: "2020-11-15",
                                  sortBy: "publishedAt",
                                  language: "ru",
                                  apiKey: "27238040ee3648a0b0a343e009b1b55a",
                                  page: pageIndex) { list, error in
            self.articles.append(contentsOf: list?.articles ?? [])
            self.isNewPageLoading = false
        }
    }
}
