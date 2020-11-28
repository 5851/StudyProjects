//
//  CustomTabs.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct CustomTabs: View {

    // MARK: - Properties
    @Binding var indexButton: Int

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Spacer()

                // Button 1
                Button(action: {
                    self.indexButton = 0
                }, label: {

                    HStack(spacing: 15) {

                        Image("Home")

                        if self.indexButton == 0 {
                            Text("Network")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                })
                    .foregroundColor(.white)
                    .background(Color.red.opacity(self.indexButton == 0 ? 1 : 0))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer(minLength: 0)

                // Button 2
                Button(action: {
                    self.indexButton = 1
                }, label: {

                    HStack(spacing: 15) {

                        Image(systemName: "tray.full.fill")

                        if self.indexButton == 1 {
                            Text("Что-то")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                })
                    .foregroundColor(.white)
                    .background(Color.red.opacity(self.indexButton == 1 ? 1 : 0))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer(minLength: 0)

                // Button 3
                Button(action: {
                    self.indexButton = 2
                }, label: {

                    HStack(spacing: 15) {

                        Image(systemName: "archivebox.fill")

                        if self.indexButton == 2 {
                            Text("Что-то")
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                })
                    .foregroundColor(.white)
                    .background(Color.red.opacity(self.indexButton == 2 ? 1 : 0))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer()
            } // HStack
                .padding(.vertical)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .background(Color.orange)
                .cornerRadius(25)
                .animation(.default)
        } // VStack
    }
}
