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
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")
        return passwordTest.evaluate(with: self)
    }
    
    func isValidName() -> Bool
    {
        let nameTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]*$")
        return nameTest.evaluate(with: self)
    }
    
    func isValidContact() -> Bool
    {
        let mobileRegEx = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$"
        let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
        return mobileTest.evaluate(with: self)
    }
    
    func isValidDate() -> Bool
    {
        let dateRegex = "^((((0[13578])|([13578])|(1[02]))[\\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\\/](([1-9])|([0-2][0-9]))))[\\/]\\d{4}$|^\\d{4}$"
        let dateTest = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        return dateTest.evaluate(with: self)
    }
}
