//
//  UserSingleton.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

class UserSingleton: Users {
    //Rider Dictionary
    private static var dictRiders=[String:Riders]()
    
    //Driver Dictionary
    private static var dictDrivers=[String:Drivers]()
    
    static var activeRider = Riders()
    
    static func signUpRider(rider: Riders)
    {
        dictRiders.updateValue(rider, forKey: rider.id!)
    }
    
    static func signUpDriver(driver: Drivers)
    {
        dictDrivers.updateValue(driver, forKey: driver.id!)
    }
    
    static func getRiderByMail(mail: String) -> Riders?{
        for rider in dictRiders{
            if rider.value.email == mail{
                return rider.value
            }else{
                return nil
            }
        }
        return nil
    }
    
    static func riderMailExist(mail: String) -> Bool{
        for rider in dictRiders{
            if rider.value.email == mail{
                return true
            }else{
                return false
            }
        }
        return false
    }
    
    static func riderContactExist(contact: String) -> Bool{
        for rider in dictRiders{
            if rider.value.contact == contact{
                return true
            }else{
                return false
            }
        }
        return false
    }
    
    
}
