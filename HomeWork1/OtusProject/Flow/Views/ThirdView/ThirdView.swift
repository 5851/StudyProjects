//
//  ThirdView.swift
//  OtusProject
//
//  Created by MAC on 28.08.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct ThirdView: View {

    // MARK: - Properties
    @State private var showingModalWindow = false

    // MARK: - Body
    var body: some View {
        Button(action: {
            self.showingModalWindow.toggle()
        }, label: {
            Text("Кнопка")
        })
        .sheet(isPresented: $showingModalWindow, content: {
            ModalView()
        })
    } // Body
}

struct ThirdView_Previews: PreviewProvider {

    // MARK: - Previews
    static var previews: some View {
        ThirdView()
    }
}
