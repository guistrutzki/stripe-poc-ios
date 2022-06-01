//
//  NetworkError.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case noData
    case invalidStatusCode(code: Int)
    case custom(error: Error)
}
