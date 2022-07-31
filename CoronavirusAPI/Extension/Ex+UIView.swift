//
//  Ex+UIView.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 27/07/22.
//

import Foundation
import UIKit

extension UIView {

    func setGradientColor(colorOne: UIColor, colorTwo: UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]

        layer.insertSublayer(gradientLayer, at: 0)
   }
}
