//
//  LocationCell.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import rick_morty_swift_api
import RealmSwift

struct LocationRealmCell: View {

    // MARk: - Properties
    let location: LocationDB

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: " + "\(location.id)")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Type: " + location.type)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Dimension: " + location.dimension)
                    Text("URL: " + location.url)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
        } // VStack
    } // Body
}
