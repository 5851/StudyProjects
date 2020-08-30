//
//  SecondView.swift
//  OtusProject
//
//  Created by MAC on 28.08.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct SecondView: View {

    // MARK: - Properties
    @Binding var indexRow: Int?

    // MARK: - Body
    var body: some View {

        NavigationView {
            List(0..<10) { item in
                NavigationLink(destination: InfoView(infoTitle: item),
                               tag: item,
                               selection: self.$indexRow) {
                    Text("Number of rows \(item)")
                } // Navigation Link
            } // List
            .navigationBarTitle("Navigation", displayMode: .inline)
        } // NavigationView
    } // Body
}

struct SecondView_Previews: PreviewProvider {

    // MARK: - Properties
    @State static var indexRow: Int? = 1

    // MARK: - Previews
    static var previews: some View {
        SecondView(indexRow: $indexRow)
    }
}
