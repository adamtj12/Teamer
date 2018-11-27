//
//  TeamSelectionPresenter.swift
//  SampleCS
//
//  Created by Adam Johnston on 15/11/2018.
//  Copyright (c) 2018 Adam Johnston. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TeamSelectionPresentationLogic
{
  func displayTeamData(showing: NSMutableArray)
}

class TeamSelectionPresenter: TeamSelectionPresentationLogic
{
  weak var viewController: TeamSelectionDisplayLogic?
  
  // MARK: Do something
  
  func displayTeamData(showing: NSMutableArray){
    var playerTeamA = TeamSelection.Something.PlayerModel()
    var playerTeamB = TeamSelection.Something.PlayerModel()
    var playerTeamUA = TeamSelection.Something.PlayerModel()
    var playerModel = TeamSelection.Something.TeamResponse(playerA: playerTeamA, playerB: playerTeamB, playerUA: playerTeamUA, groupArrayA: [], groupArrayB: [], groupArrayUA: [])

    for i in 0...showing.count-1{
        let dict : NSDictionary = showing.object(at: i) as! NSDictionary
      
        if((dict.object(forKey: "teamOption") as! String) == "Team A"){
            playerTeamA.firstName = dict.object(forKey: "firstName") as! String
            playerTeamA.lastName = dict.object(forKey: "lastName") as! String
            playerTeamA.email = dict.object(forKey: "email") as! String
            playerTeamA.userRating = dict.object(forKey: "userRating") as! NSNumber
            playerTeamA.teamOption = dict.object(forKey: "teamOption") as! String
            playerTeamA.id = dict.object(forKey: "id") as! String
            playerTeamA.userId = dict.object(forKey: "Userid") as! String
            playerTeamA.teamCaptain = dict.object(forKey: "teamCaptain") as! Bool
            playerTeamA.groupID = dict.object(forKey: "groupID") as! String
            playerTeamA.groupName = dict.object(forKey: "groupName") as! String
            playerModel.groupArrayA.add(playerTeamA)
        }
        else if((dict.object(forKey: "teamOption") as! String) == "Team B"){
            playerTeamB.firstName = dict.object(forKey: "firstName") as! String
            playerTeamB.lastName = dict.object(forKey: "lastName") as! String
            playerTeamB.email = dict.object(forKey: "email") as! String
            playerTeamB.userRating = dict.object(forKey: "userRating") as! NSNumber
            playerTeamB.teamOption = dict.object(forKey: "teamOption") as! String
            playerTeamB.id = dict.object(forKey: "id") as! String
            playerTeamB.userId = dict.object(forKey: "Userid") as! String
            playerTeamB.teamCaptain = dict.object(forKey: "teamCaptain") as! Bool
            playerTeamB.groupID = dict.object(forKey: "groupID") as! String
            playerTeamB.groupName = dict.object(forKey: "groupName") as! String
            playerModel.groupArrayB.add(playerTeamB)
        }
        else{
            playerTeamUA.firstName = dict.object(forKey: "firstName") as! String
            playerTeamUA.lastName = dict.object(forKey: "lastName") as! String
            playerTeamUA.email = dict.object(forKey: "email") as! String
            playerTeamUA.userRating = dict.object(forKey: "userRating") as! NSNumber
            playerTeamUA.teamOption = dict.object(forKey: "teamOption") as! String
            playerTeamUA.id = dict.object(forKey: "id") as! String
            playerTeamUA.userId = dict.object(forKey: "Userid") as! String
            playerTeamUA.teamCaptain = dict.object(forKey: "teamCaptain") as! Bool
            playerTeamUA.groupID = dict.object(forKey: "groupID") as! String
            playerTeamUA.groupName = dict.object(forKey: "groupName") as! String
            playerModel.groupArrayUA.add(playerTeamUA)
        }
    }
    viewController?.displayPlayerInformation(playerModel: playerModel)
}
}
