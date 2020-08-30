//
//  FirstView.swift
//  OtusProject
//
//  Created by MAC on 28.08.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct FirstView: View {

    // MARK: - Properties
    @Binding var selection: Int
    @Binding var indexRow: Int?

    // MARK: - Body
    var body: some View {
        Button(action: {
            self.selection = 1
            self.indexRow = 2
        }, label: {
            Text("Кнопка")
        }) // Button
    } // Body
}

struct FirstView_Previews: PreviewProvider {

    // MARK: - Properties
    @State static var selection: Int = 1
    @State static var indexRow: Int? = 1

    // MARK: - Previews
    static var previews: some View {
        FirstView(selection: $selection, indexRow: $indexRow)
    }
}
