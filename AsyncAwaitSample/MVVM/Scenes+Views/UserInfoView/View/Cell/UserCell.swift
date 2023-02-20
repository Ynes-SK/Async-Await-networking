//
//  UserCell.swift
//  AsyncAwaitSample
//
//  Created by Ynes on 20/2/2023.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
