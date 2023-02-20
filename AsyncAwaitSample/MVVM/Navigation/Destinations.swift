//
//  Destinations.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import UIKit
enum Destinations {
    case welcomeView
    case userView
    var viewcontroller: UIViewController {
        switch self {             
        case .welcomeView:
            return WelcomeViewController()
        case .userView:
            let viewModel = UserViewModel()
            return UserViewController(with: viewModel)
        }
    }
}
