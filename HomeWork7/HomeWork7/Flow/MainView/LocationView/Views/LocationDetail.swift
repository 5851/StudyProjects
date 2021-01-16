//
//  LocationDetail.swift
//  HomeWork7
//
//  Created by MAC on 25.12.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct LocationDetail: View {

    // MARk: - Properties
    let location: LocationDB

    // MARK: - Body
    public var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name: " + location.name)
                        .fontWeight(.bold)
                    Text("Type: " + location.type)
                        .fontWeight(.bold)
                    Text("Id: \(location.id)")
                        .fontWeight(.bold)
                    Text("Dimension: " + location.dimension)
                        .fontWeight(.bold)
                    Text("Url: \n" + location.url)
                        .fontWeight(.bold)
                    Text("Created: \n" + location.created)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 30)

            Spacer()
        } // ScrollView
    } // Body
}
