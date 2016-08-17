//
//  Profile.swift
//  BodyFacts
//
//  Created by Tracy Richard on 8/12/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import Firebase
class Event : NSObject {
    
    
    var key: String?
    var title: String

    var date: String
    var bodyPart: String
    var details: String
    

    
    init(title: String!, date: String!, bodyPart: String!, details: String!) {
        self.title = title
        self.date = date
        self.bodyPart = bodyPart
        self.details = details
    }
    
    
}
