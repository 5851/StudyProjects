//
//  Cell.swift
//  HomeWork9
//
//  Created by MAC on 24.12.2020.
//

import SwiftUI

struct ModelCell : View {

    // MARK: - Properteis
    var model: Model

    // MARK: - Body
    var body: some View {
        return NavigationLink(destination:
            ModelDetail(model: model)
        ){
            HStack{
                Image(model.imageName)
                    .resizable()
                    .frame(width: 100, height: 60)

                Text(model.name)
            } // HStack
        }
    }
}
