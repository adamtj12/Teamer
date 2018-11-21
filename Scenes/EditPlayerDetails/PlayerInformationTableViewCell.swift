//
//  PlayerInformationTableViewCell.swift
//  EventManagementSystem
//
//  Created by Adam Johnston on 20/09/2018.
//  Copyright © 2018 Adam Johnston. All rights reserved.
//

import UIKit
import iOSDropDown

class PlayerInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var teamSelectionDropDown: DropDown!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
