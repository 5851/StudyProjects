//
//  File.swift
//  
//
//  Created by MAC on 01.10.2020.
//

import SwiftUI

public struct UILocationCell: View {

    // MARk: - Properties
    let locationName: String
    let locationType: String
    let locationDimension: String
    let locationURL: String

    // MARK: - Init
    public init(
        locationName: String,
        locationType: String,
        locationDimension: String,
        locationURL: String) {
        self.locationName = locationName
        self.locationType = locationType
        self.locationDimension = locationDimension
        self.locationURL = locationURL
    }

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: " + locationName)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Type: " + locationType)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Dimension: " + locationDimension)
                    Text("URL: " + locationURL)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
                .contextMenu {
                    VStack {
                        Text("111")
                    }
                }
        } // VStack
    } // Body
}
