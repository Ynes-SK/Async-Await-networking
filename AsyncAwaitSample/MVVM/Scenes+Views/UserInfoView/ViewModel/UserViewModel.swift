//
//  UserViewModel.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
class UserViewModel {
    private var userAPI: ApiClientProtocol
    // MARK: - Initialization
    init(userAPI: ApiClientProtocol = ApiClient()) {
        self.userAPI = userAPI
    }
    func getUser() async -> [User]{
        let result = await userAPI.sendRequest(UserInfoAPI.userInfo, responseModel: [User].self)
        switch result {
        case .success(let response):
            return response
        case .failure:
          return []
        }
    }
}
