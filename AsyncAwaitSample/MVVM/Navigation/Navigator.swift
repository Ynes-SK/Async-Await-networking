//
//  Navigator.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
import UIKit
enum NavigatorError: Error {
    case noRoot
}
final class AppNavigator {
    static var rootController: UINavigationController!
    
    init(window: UIWindow, viewController : UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        AppNavigator.rootController = nav
        window.rootViewController = nav
        window.makeKeyAndVisible()
        return
    }
    init() throws {
        if AppNavigator.rootController == nil {
            throw NavigatorError.noRoot
        }
    }
    func present(_ destination: Destinations) {
        AppNavigator.rootController.present(destination.viewcontroller, animated: true, completion: nil)
    }
    
    func back() {
        AppNavigator.rootController.popViewController(animated: true)
    }
    
    func popToRoot() {
        AppNavigator.rootController.popToRootViewController(animated: true)
    }
    
    func push(_ destination: Destinations) {
        AppNavigator.rootController.pushViewController(destination.viewcontroller, animated: true)
    }
    func dismiss() {
        AppNavigator.rootController.dismiss(animated: false, completion: nil)
    }
}
