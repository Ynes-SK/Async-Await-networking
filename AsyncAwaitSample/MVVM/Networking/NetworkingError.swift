//
//  NetworkingError.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

enum NetworkingError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decoding error"
        case .unauthorized:
            return "not authorized"
        case .invalidURL:
            return "This is an invalide URL"
        default:
            return "Unknown error"
        }
    }
}
