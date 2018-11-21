//
//  LogOutButtonTableViewCell.swift
//  EventManagementSystem
//
//  Created by Adam Johnston on 02/10/2018.
//  Copyright © 2018 Adam Johnston. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class LogOutButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var logOutButton: UIButton!
    
    @IBOutlet var button: FBSDKLoginButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
