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
    
    static func signUpRider(rider: Riders)
    {
        dictRiders.updateValue(rider, forKey: rider.id!)
    }
    
    static func signUpDriver(driver: Drivers)
    {
        dictDrivers.updateValue(driver, forKey: driver.id!)
    }
}
