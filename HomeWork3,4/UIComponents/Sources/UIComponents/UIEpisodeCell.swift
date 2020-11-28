//
//  File.swift
//  
//
//  Created by MAC on 01.10.2020.
//

import SwiftUI

public struct UIEpisodeCell: View {

    // MARk: - Properties
    let episodeName: String
    let episodeAirDate: String
    let episodeNumber: String
    let episodeURL: String

    // MARK: - Init
    public init(
        episodeName: String,
        episodeAirDate: String,
        episodeNumber: String,
        episodeURL: String) {
        self.episodeName = episodeName
        self.episodeAirDate = episodeAirDate
        self.episodeNumber = episodeNumber
        self.episodeURL = episodeURL
    }

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: " + episodeName)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Air Date: " + episodeAirDate)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Episode: " + episodeNumber)
                    Text("URL: " + episodeURL)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
        } // VStack
    } // Body
}
