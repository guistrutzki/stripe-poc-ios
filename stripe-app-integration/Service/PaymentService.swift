//
//  PaymentService.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

final class PaymentService {
    private let networkClient = NetworkClient()
    let API_URL = "http://192.168.1.5:3000/payments"
    
    func createPaymentIntent(bodyParams: PaymentIntentBody, _ completion:
                            @escaping (Result<PaymentIntentResponse?, NetworkError>) -> Void) {
        
        networkClient.performRequest(method: .post,
                                     url: URL(string: "\(API_URL)/create-payment-intent")!,
                                     urlParameters: [:],
                                     headers: [:],
                                     body: bodyParams.toData(),
                                     completion: completion)
    }
}
