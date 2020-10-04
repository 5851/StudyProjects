//
//  File.swift
//  
//
//  Created by MAC on 01.10.2020.
//

import SwiftUI
import SDWebImageSwiftUI

public struct UICharacterCell: View {

    // MARk: - Properties
    let characterName: String
    let characterStatus: String
    let characterCreated: String
    let characterType: String
    let characterImage: String
    let characterOrigin: String
    let characterLocation: String

    // MARK: - Init
    public init(
        characterName: String,
        characterStatus: String,
        characterCreated: String,
        characterType: String,
        characterImage: String,
        characterOrigin: String,
        characterLocation: String) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterCreated = characterCreated
        self.characterType = characterType
        self.characterImage = characterImage
        self.characterOrigin = characterOrigin
        self.characterLocation = characterLocation
    }

    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {

                HStack {
                    WebImage(url: URL(string: characterImage))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .cornerRadius(50)

                    VStack(alignment: .leading) {
                        Text("Name: " + characterName)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Status: " + characterStatus)

                        Spacer()
                    } // VStack

                    Spacer()
                } // HStack
                    .padding()

                VStack(alignment: .leading) {
                    Text("Name origin: " + characterOrigin)
                    Text("Name location: " + characterLocation)
                    Text(characterCreated)
                } // VStack
                    .padding([.leading, .trailing, .bottom])
            } // VStack
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
        } // VStack
    } // Body
}

