//
//  Drivers.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

class Drivers: Users
{
    var RoutesAssigned = [String:Routes]()
    var busNumber: String
    
    
    
    override init() {
        self.busNumber = String()
        super.init()
    }
    
    init(password: String, firstName: String, lastName: String, dateOfBirth: String, email: String, contact: String, busNumber: String)
    {
        self.busNumber = busNumber
        super.init(password: password, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, email: email, contact: contact)
    }
    
}

