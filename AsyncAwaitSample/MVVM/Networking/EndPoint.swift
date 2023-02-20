//
//  EndPoint.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

protocol Endpoint {
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

