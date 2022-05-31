//
//  UIFont+Ext.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import UIKit

extension UIFont {
    
    enum QuicksandFontWeight {
        case bold
        case light
        case medium
        case regular
        case semibold
        
        var systemFontWeight: UIFont.Weight {
            switch self {
            case .bold:
                return .bold
            case .light:
                return .light
            case .medium:
                return .medium
            case .regular:
                return .regular
            case .semibold:
                return .semibold
            }
        }
    }
    
    static func Quicksand(withWeight weight: QuicksandFontWeight, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "Quicksand-Bold", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .semibold:
            return UIFont(name: "Quicksand-SemiBold", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .regular:
            return UIFont(name: "Quicksand-Regular", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .light:
            return UIFont(name: "Quicksand-Light", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .medium:
            return UIFont(name: "Quicksand-Medium", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        }
    }
}
