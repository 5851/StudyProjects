//
//  FeedDataProvider.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import Foundation

struct FeedDataProvider {

    func feedMockData() -> [FeedData] {
        var feedData = [FeedData]()
        feedData.append(FeedData(name: "Array", time: "-"))
        feedData.append(FeedData(name: "Set", time: "-"))
        feedData.append(FeedData(name: "Dictionary", time: "-"))
        return feedData
    }
}
