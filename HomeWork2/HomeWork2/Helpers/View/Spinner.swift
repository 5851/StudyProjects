//
//  StarshipView.swift
//  StarWarsProject
//
//  Created by MAC on 12.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
import UIKit

struct Spinner: UIViewRepresentable {

    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
