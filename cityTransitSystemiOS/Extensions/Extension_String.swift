//
//  Extension_String.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

extension String
{
    func isValidEmail() -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self)
    }
    
    func isValidName() -> Bool
    {
        let nameTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]*$")
        return nameTest.evaluate(with: self)
    }
    
    func isValidContact() -> Bool
    {
        let mobileRegEx = "^[0-9]{10}$"
        let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
        return mobileTest.evaluate(with: self)
    }
}
