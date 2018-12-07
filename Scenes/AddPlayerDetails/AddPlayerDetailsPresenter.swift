//
//  AddPlayerDetailsPresenter.swift
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

protocol AddPlayerDetailsPresentationLogic
{
    func presentSomething(response: AddPlayerDetails.Something.Response)
    func displayJoinTeam(showing: AddPlayerDetails.Something.PlayerModel)
    func presentAlreadyCaptainCheck(response: AddPlayerDetails.Something.Response)
    func presentUpdateTeam()
    func successfulPlayerCount(response: AddPlayerDetails.Something.ResponseGroups)
}

class AddPlayerDetailsPresenter: AddPlayerDetailsPresentationLogic
{
    func presentAlreadyCaptainCheck(response: AddPlayerDetails.Something.Response) {
        viewController?.showCaptainRespinse(response: response)
    }
    
    weak var viewController: AddPlayerDetailsDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: AddPlayerDetails.Something.Response)
    {
        let viewModel = AddPlayerDetails.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func displayJoinTeam(showing: AddPlayerDetails.Something.PlayerModel){
        var details = AddPlayerDetails.Something.PlayerModel()
        details.firstName = showing.firstName
        details.lastName = showing.lastName
        details.teamOption = showing.teamOption
        details.userRating = showing.userRating
        details.id = showing.id
        details.teamCaptain = showing.teamCaptain
        details.numOfValues = showing.numOfValues
        details.email = showing.email
        details.userId = showing.userId
        viewController?.addedPlayerDetails(showing: details)
    }
    
    func successfulPlayerCount(response: AddPlayerDetails.Something.ResponseGroups) {
        viewController?.successfulTeamCount(response: response)
    }
    
    func presentUpdateTeam()
    {
        viewController?.setToUnassignedIfTeamsFull()
    }
    

}
