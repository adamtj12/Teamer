//
//  EditPlayerDetailsViewController.swift
//  SampleCS
//
//  Created by Adam Johnston on 20/11/2018.
//  Copyright (c) 2018 Adam Johnston. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

protocol EditPlayerDetailsDisplayLogic: class
{
  func displaySomething(player: EditPlayerDetails.Something.PlayerModel)
  func successfulTeamCount(response: EditPlayerDetails.Something.ResponseGroups)

}

protocol UpdatePlayeronTeamSelector : class {
    func updatePlayer(tags: [Int])
}


class EditPlayerDetailsViewController: UITableViewController, EditPlayerDetailsDisplayLogic
{
  var interactor: EditPlayerDetailsBusinessLogic?
  var router: (NSObjectProtocol & EditPlayerDetailsRoutingLogic & EditPlayerDetailsDataPassing)?
  let db = Firestore.firestore()
  @IBOutlet weak var editButton: UIBarButtonItem!
  // MARK: Object lifecycle
  var teamSelectionVC = TeamSelectionViewController()
  var request = EditPlayerDetails.Something.PlayerModel()

  var delegate: updatePlayer?
    
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = EditPlayerDetailsInteractor()
    let presenter = EditPlayerDetailsPresenter()
    let router = EditPlayerDetailsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    if Auth.auth().currentUser != nil {
        if(Auth.auth().currentUser?.email == router?.player.email || router?.player.teamCaptain == true)
        {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }else{
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        // User is signed in.
        // ...
    } else {
        // No user is signed in.
        // ...
    }

//    doSomething()
  }
    
    @IBAction func editPlayerPressed(_ sender: Any) {
        let cells = self.tableView.visibleCells as! Array<PlayerInformationTableViewCell>
        let button = sender as! UIBarButtonItem
        if(button.title == "Edit"){
            for cell in cells {
                cell.valueField.isUserInteractionEnabled = true
                cell.ratingSlider.isUserInteractionEnabled = true
                cell.teamSelectionDropDown.isUserInteractionEnabled = true
                if(cell.descriptLabel.text == "First Name:"){
                    cell.valueField.becomeFirstResponder()
                }
            }
            editButton.title = "Save Changes"
        }
        else{
            let cells = self.tableView.visibleCells as! Array<PlayerInformationTableViewCell>
            for cell in cells {
                cell.valueField.isUserInteractionEnabled = false
                cell.ratingSlider.isUserInteractionEnabled = false
                
                if(cell.valueField.tag == 0){
                    request.firstName = cell.valueField.text!
                }else if(cell.valueField.tag == 1){
                    request.lastName = cell.valueField.text!
                }
                if(cell.valueField.tag == 2){
                    request.email = cell.valueField.text!
                }
                if(cell.valueField.tag == 3){
                    let ratingValue = (Float(Int((cell.ratingSlider.value * 15).rounded()) + 1/10))
                    request.userRating = NSNumber(value : ratingValue)
                }
                
                if(cell.valueField.tag == 4){
                    request.teamOption = cell.teamSelectionDropDown.text!
                }
            }
            request.id = (router?.player.id)!
            request.groupID = (router?.player.groupID)!
            self.interactor?.countUsersInTeam(request: request, currentInteractor: self.interactor as! EditPlayerDetailsInteractor)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 4){
            return 150
        }
        return 75
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! PlayerInformationTableViewCell
        switch indexPath.row {
        case 0:
            cell.descriptLabel.text = "First Name:"
            cell.valueField.text = router?.player.firstName
            cell.valueField.tag = 0
        case 1:
            cell.descriptLabel.text = "Last Name:"
            cell.valueField.text = router?.player.lastName
            cell.valueField.tag = 1
        case 2:
            cell.descriptLabel.text = "Email:"
            cell.valueField.text = router?.player.email
            cell.valueField.tag = 2
        case 3:
            cell.descriptLabel.text = "Rating:"
            let userRating =  router?.player.userRating
            cell.ratingSlider.isHidden = false
            cell.valueField.isHidden = true
            cell.ratingSlider.value = Float(truncating: userRating!)
            cell.valueField.tag = 3
        case 4:
            cell.descriptLabel.text = "Team:"
            cell.teamSelectionDropDown.text = router?.player.teamOption
            cell.valueField.isHidden = true
            cell.teamSelectionDropDown.isHidden = false
            cell.valueField.tag = 4
        default:
            cell.descriptLabel.text = "First Name:"
            cell.valueField.text = router?.player.firstName
        }
        return cell
    }

  // MARK: Do something
  //@IBOutlet weak var nameTextField: UITextField!
  func doSomething()
  {
//    let request = EditPlayerDetails.Something.Request()
//
//    interactor?.doSomething(request: (router?.player)!, currentInteractor: currentInteractor: self.interactor as! JoinSquadInteractor)
  }
  
  func displaySomething(player: EditPlayerDetails.Something.PlayerModel)
  {
        print("SUCCESS")
       delegate?.onPlayerUpdateReady()
       navigationController?.popViewController(animated: true)
    }
    
    func successfulTeamCount(response: EditPlayerDetails.Something.ResponseGroups) {
        if(response.teamACount < 5 && self.request.teamOption == "Team A") {
            interactor?.doSomething(request: self.request, currentInteractor: self.interactor as! EditPlayerDetailsInteractor)
        }
        else if(response.teamBCount < 5 && self.request.teamOption == "Team B"){
            interactor?.doSomething(request: self.request, currentInteractor: self.interactor as! EditPlayerDetailsInteractor)
        }
        else {
            self.request.teamOption = "Unassigned"
            interactor?.doSomething(request: self.request, currentInteractor: self.interactor as! EditPlayerDetailsInteractor)
        }
    }
}
