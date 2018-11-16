//
//  JoinSquadModels.swift
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

enum JoinSquad
{
    // MARK: Use cases
    
    enum Something
    {
        struct Request
        {
            var userId = String()
        }
        struct ResponseGroups
        {
            var groupArray : NSMutableArray
        }
        
        struct RequestToAdd
        {
            var userId = String()
            var selectedGroup = NSDictionary()
        }
        struct ResponseToAdding
        {
            //        var userId = String()
            //        var selectedGroup = NSDictionary()
        }
        
        struct GroupModel
        {
            var groupArray : NSMutableArray
        }
        
    }
}