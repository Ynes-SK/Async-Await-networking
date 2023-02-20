//
//  NetworkingManager.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
protocol ApiClientProtocol {
    func sendRequest<T: Decodable>(_ endpoint: Endpoint, responseModel: T.Type) async -> Result<T, NetworkingError>
}
class ApiClient: ApiClientProtocol {
    func sendRequest<T: Decodable>(_ endpoint: Endpoint,responseModel: T.Type) async -> Result<T, NetworkingError> {
        guard let url = URL(string: (Constants.baseUrl)) else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url.appendingPathComponent(endpoint.path))
        print("request", request)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200 , 201, 204:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
