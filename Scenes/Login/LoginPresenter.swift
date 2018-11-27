//  LoginPresenter.swift
//  SampleCS
//  Created by Adam Johnston on 08/11/2018.
//  Copyright (c) 2018 Adam Johnston. All rights reserved.
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

protocol LoginPresentationLogic
{
    func presentSomething(response: Login.Something.Response)
    func toggleAddUserView(showing: Login.Something.AddUserToggleScreen)
    func displayAddedUserScreen(showing: AuthDataResult)
    func displayLoggedInUserScreen(showing: AuthDataResult)
    func displayLoggedInUserScreenFacebook()
    func returnGroupID(groupID: String)

}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    // MARK: Do something
    
    func presentSomething(response: Login.Something.Response)
    {
        let viewModel = Login.Something.PlayerModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func toggleAddUserView(showing: Login.Something.AddUserToggleScreen)
    {
        viewController?.toggleAddUserView(show: showing)
    }
    
    func displayAddedUserScreen(showing: AuthDataResult)
    {
        var response = Login.Something.PlayerModel()
        response.email = showing.user.email!
        response.userId = showing.user.uid
        viewController?.addPlayer(show: response)
    }
    
    func displayLoggedInUserScreen(showing: AuthDataResult)
    {
        var response = Login.Something.PlayerModel()
        response.email = showing.user.email!
        response.userId = showing.user.uid
        viewController?.loginPlayer(show: response)
    }
    
    func displayLoggedInUserScreenFacebook()
    {
//        viewController?.loginPlayer(show: showing)
    }
    
    func returnGroupID(groupID: String) {
        viewController?.returnedGroupID(groupID: groupID)
    }
}
