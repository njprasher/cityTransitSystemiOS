//
//  Users.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

class Users
{
    var id: String?
    private var _password = String()
    var firstName: String
    var lastName: String
    var dateOfBirth: String
    var email: String
    var contact: String
    
    init()
    {
        self.id = String()
        self.firstName = String()
        self.lastName = String()
        self.dateOfBirth = String()
        self.email = String()
        self.contact = String()
    }
    
    var password: String?
    {
        get{
            return self._password
        }
    }
    
    func setPassword(password: String)
    {
        self._password = password
    }
    
    init(password: String, firstName: String, lastName: String, dateOfBirth: String, email: String, contact: String)
    {   self.id = String(Int.random(in: 1...100000000))
        self._password = password
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.contact = contact
    }
    
    var fullName: String // computed variable
    {
        return "\(String(describing: self.firstName)) \(String(describing: self.lastName))"
    }
}

