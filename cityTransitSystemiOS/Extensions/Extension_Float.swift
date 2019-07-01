//
//  Extension_Float.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

extension Float
{
    public func currency() -> String
    {
        return String.init(format: "$%0.2f", self)
    }
}
