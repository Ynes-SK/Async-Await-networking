//
//  UserModel.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
struct User: Codable, Identifiable {
    var id: String
    var createdAt: String
    var name: String
    var avatar: String
    enum CodingKeys: CodingKey {
        case id
        case createdAt
        case name
        case avatar
    }
}
