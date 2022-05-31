//
//  UIView+Ext.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import UIKit

extension UIView {
    func setShadow(shadowColor: UIColor = .black, shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 3, shadowOffset: CGSize = CGSize(width: 0, height: 5)) {
           self.layer.shadowColor = shadowColor.cgColor
           self.layer.shadowOpacity = shadowOpacity
           self.layer.shadowRadius = shadowRadius
           self.layer.shadowOffset = shadowOffset
           self.layer.masksToBounds = false
    }
    
    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        
//        if isVertical {
//            gradientLayer.locations = [0.0, 1.0]
//        } else {
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        }
        
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
}


