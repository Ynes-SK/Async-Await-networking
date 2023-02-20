//
//  WelcomeViewController.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: UIButton) {
        try? AppNavigator().push(.userView)
    }

}

