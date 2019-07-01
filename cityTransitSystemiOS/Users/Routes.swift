//
//  Routes.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

class Routes
{
    var routeName: String
    var routeId: String
    var routeStart: String
    var routeEnd: String
    
    init()
    {
        self.routeName = String()
        self.routeId = String()
        self.routeStart = String()
        self.routeEnd = String()
    }
    
    init(routeName: String, routeId: String, routeStart: String, routeEnd: String)
    {
        self.routeName = routeName
        self.routeId = routeId
        self.routeStart = routeStart
        self.routeEnd = routeEnd
    }
}
