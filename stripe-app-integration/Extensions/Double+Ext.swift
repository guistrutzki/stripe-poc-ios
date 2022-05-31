//
//  Double+Ext.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

private let numberFormatter = NumberFormatter()

extension Double {
    func currencyStringLocalizedWithSymbol(currency: Currency) -> String {
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: currency.rawValue)
        numberFormatter.currencySymbol = numberFormatter.locale.currencySymbol
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(for: self) ?? ""
    }
}
