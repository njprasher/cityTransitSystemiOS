//
//  Routes.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

enum RouteColor{
    case Red, Green, Blue, Orange, Yellow
    case white
}

class Routes
{
    var routeName: String
    var routeId: String
    var routeStart: String
    var routeEnd: String
    var routeFrequency: Int
    var routePrice: Float
    var routeColor: RouteColor
    
    init()
    {
        self.routeName = String()
        self.routeId = String()
        self.routeStart = String()
        self.routeEnd = String()
        self.routeFrequency = Int()
        self.routePrice = Float()
        self.routeColor = RouteColor.white
    }
    
    init(routeName: String, routeId: String, routeStart: String, routeEnd: String, routePrice: Float, routeFrequency: Int , routeColor: RouteColor)
    {
        self.routeName = routeName
        self.routeId = routeId
        self.routeStart = routeStart
        self.routeEnd = routeEnd
        self.routeFrequency = routeFrequency
        self.routePrice = routePrice
        self.routeColor = routeColor
    }
}
