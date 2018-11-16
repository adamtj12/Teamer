//  JoinSquadRouter.swift
//  SampleCS
//
//  Created by Adam Johnston on 14/11/2018.
//  Copyright (c) 2018 Adam Johnston. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol JoinSquadRoutingLogic
{
    func routeToSomewhere()
    var playerDetails: String {get set}
}

protocol JoinSquadDataPassing
{
    var dataStore: JoinSquadDataStore? { get }
}

class JoinSquadRouter: NSObject, JoinSquadRoutingLogic, JoinSquadDataPassing
{
    var playerDetails: String = ""
    weak var viewController: JoinSquadViewController?
    var dataStore: JoinSquadDataStore?
    
    func routeToSomewhere(){
        viewController?.performSegue(withIdentifier: "showTeams", sender: nil)
    }
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: JoinSquadViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: JoinSquadDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}