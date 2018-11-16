//
//  AddPlayerDetailsViewController.swift
//  SampleCS
//
//  Created by Adam Johnston on 13/11/2018.
//  Copyright (c) 2018 Adam Johnston. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AddPlayerDetailsDisplayLogic: class
{
    func displaySomething(viewModel: AddPlayerDetails.Something.ViewModel)
    func addedPlayerDetails(showing: AddPlayerDetails.Something.PlayerModel)
}

class AddPlayerDetailsViewController: UIViewController, AddPlayerDetailsDisplayLogic
{
    var interactor: AddPlayerDetailsBusinessLogic?
    var router: (NSObjectProtocol & AddPlayerDetailsRoutingLogic & AddPlayerDetailsDataPassing)?
    var uid : String?
    
    @IBOutlet weak var addUserView: AddUserView!
    
    // MARK: Object lifecycle
    
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
        let interactor = AddPlayerDetailsInteractor()
        let presenter = AddPlayerDetailsPresenter()
        let router = AddPlayerDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        //    ptrouter.loginDetails
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let destinationVC = segue.destination as? JoinSquadViewController {
                destinationVC.router?.playerDetails = uid!
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = AddPlayerDetails.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: AddPlayerDetails.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    @IBAction func submitUserToServer(_ sender: Any) {
        var userDetails = AddPlayerDetails.Something.Request()
        let ratingValue = (Float(Int((self.addUserView.userRatingSlider.value * 15).rounded()) + 1/10))
        userDetails.email = router?.loginDetails![0] as! String
        userDetails.userId = router?.loginDetails![1] as! String
        userDetails.firstName = addUserView.firstNameTextField.text ?? ""
        userDetails.lastName = addUserView.lastNameTextField.text ?? ""
        userDetails.teamOption = addUserView.teamSelectionDropDown.text ?? ""
        userDetails.userRating = NSNumber(value : ratingValue)
        userDetails.id = UUID().uuidString
        if(addUserView.teamCaptainDropDown.text == "Yes"){
            userDetails.teamCaptain = true
        }else{
            userDetails.teamCaptain = false
        }
        userDetails.numOfValues = 5
        interactor?.submitPlayerDetailsToServer(add: userDetails, currentInteractor: interactor as! AddPlayerDetailsInteractor)
    }
    
    func addedPlayerDetails(showing: AddPlayerDetails.Something.PlayerModel) {
        print("CLEAN SWIFT WORKED")
        uid = showing.userId
        router?.routeToSomewhere()
    }
}