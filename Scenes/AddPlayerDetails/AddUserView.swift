//
//  AddUserView.swift
//  EventManagementSystem
//
//  Created by Adam Johnston on 19/09/2018.
//  Copyright © 2018 Adam Johnston. All rights reserved.
//

import UIKit
import iOSDropDown

class AddUserView: UIView {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userRatingSlider: UISlider!
    @IBOutlet weak var teamSelectionDropDown: DropDown!
    @IBOutlet weak var teamCaptainDropDown: DropDown!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        
        self.teamSelectionDropDown.optionArray = ["Team A", "Team B"]
        self.teamSelectionDropDown.optionIds = [1,23,54,22]
        self.teamSelectionDropDown.didSelect{(selectedText , index ,id) in
        }
        self.teamCaptainDropDown.optionArray = ["Yes", "No"]
        self.teamCaptainDropDown.optionIds = [1,23,54,22]
        self.teamCaptainDropDown.didSelect{(selectedText , index ,id) in
        }
        self.teamCaptainDropDown.inputView = UIView()
        self.teamSelectionDropDown.inputView = UIView()

    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
