//
//  PaymentIntentResponse.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

struct PaymentIntentResponse: Decodable {
    let clientSecret: String
    let publishableKey: String
    let customerId: String
    let ephemeralKey: String
}

struct PaymentIntentBody: Encodable {
    let amount: Double
    let currency: String
}
