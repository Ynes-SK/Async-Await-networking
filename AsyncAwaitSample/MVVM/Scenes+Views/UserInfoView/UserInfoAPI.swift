//
//  UserInfoAPI.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
enum UserInfoAPI {
    case userInfo
}
extension UserInfoAPI: Endpoint {
    var path: String {
        switch self {
        case .userInfo:
            return "getRequest"
        }
    }
    var method: RequestMethod {
        switch self {
        case .userInfo:
            return .get
        }
    }
    var header: [String : String]? {
        switch self {
        case .userInfo:
            return nil
        }
    }
    var body: [String : String]? {
        switch self {
        case .userInfo:
            return nil
        }
    }
}
