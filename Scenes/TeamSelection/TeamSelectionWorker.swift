//
//  TeamSelectionWorker.swift
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
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class TeamSelectionWorker
{
    let db = Firestore.firestore()
    var interactor: TeamSelectionInteractor?
    
    func doSomeWork(teamRequest: TeamSelection.Something.TeamRequest, currentInteractor: TeamSelectionInteractor)
    {
        var dict : NSDictionary = NSDictionary.init()
        let queue = DispatchQueue(label: "com.app.queue")
        queue.sync {
            
            self.db.collection("users").whereField("groupId", isEqualTo: teamRequest.groupID)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        let queue = DispatchQueue(label: "com.app.queue")
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            dict = document.data() as NSDictionary
                        }
                        self.interactor?.teamResonseSuccess(result: dict)
                    }}
        }
    }
}
