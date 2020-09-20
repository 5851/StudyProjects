//
//  EveryThingNews.swift
//  HomeWork2
//
//  Created by MAC on 18.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct EveryThingNews: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: NewsViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(self.viewModel.state.news) { article in
                
                NewsCell(article: article)
                    .onAppear {
                        if self.viewModel.state.news.isLastItem(article) {
                            self.viewModel.fetchEveryThingNews()
                        }
                } // NewsCell
                
            } // ForEach
            
            if self.viewModel.state.canLoadNextPage {
                HStack {
                    Spacer()
                    Text("Loading...").padding()
                    Spacer()
                } // HStack
            }
        } // List
    } // Body
}
