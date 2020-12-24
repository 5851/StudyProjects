//
//  UIImage+Extensions.swift
//  HomeWork9
//
//  Created by MAC on 22.12.2020.
//

import Foundation
import UIKit

extension UIImage {

    func resizeTo(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        return resizedImage
    }

//    func toBuffer() -> CVPixelBuffer? {
//        
//    }
}
