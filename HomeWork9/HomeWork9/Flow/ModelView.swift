//
//  ContentView.swift
//  HomeWork9
//
//  Created by MAC on 21.12.2020.
//

import SwiftUI
import CoreML
import Vision

struct ModelView: View {

    // MARK: - Properties
    var models: [Model] = modelData

    // MARK: - Body
    var body: some View {
        NavigationView {
            List(models) { model in
                ModelCell(model: model)
            } // List
            .navigationBarTitle("Test Models")
        } // NavigationView
    }
}
