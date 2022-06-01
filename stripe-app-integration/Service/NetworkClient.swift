//
//  NetworkClient.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

struct NetworkClient {
    func performRequest<T: Decodable>(method: HTTPMethod,
                                      url: URL,
                                      urlParameters: [String: String],
                                      headers: [String: String],
                                      body: Data?,
                                      completion: @escaping(Result<T?, NetworkError>) -> Void) {
        
        // Set Parameters
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = urlParameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        // Create request with parameters
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        // Set headers
        headers.forEach { headerField, value in
            request.setValue(value, forHTTPHeaderField: headerField)
        }
        
        // Set request body
        if let body = body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) {data, response, error in
            // Handle error
            guard let data = data, error == nil else {
                return completion(.failure(.badRequest))
            }
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, !(200...299 ~= statusCode) {
                return completion(.failure(.invalidStatusCode(code: statusCode)))
            }
            
            // Handle Success
            do {
                let jsonDecodable = JSONDecoder()
                
                let response = try jsonDecodable.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                return completion(.failure(.custom(error: error)))
            }
        }
        
        dataTask.resume()
    }
}
