//
//  UserViewController.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import Foundation
import UIKit
class UserViewController: UIViewController {
    private let userViewModel: UserViewModel
    @IBOutlet var tableView: UITableView!
    var resultArray = [User]()
    // MARK: - Initialization
    init(with viewModel: UserViewModel) {
        self.userViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getUser()
    }
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UserCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "UserCell")
    }
    func getUser() {
        Task {
            resultArray = await userViewModel.getUser()
            tableView.reloadData()
        }
    }
    
}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.name.text = resultArray[indexPath.row].name
        return cell
    }
}
