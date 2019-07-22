//
//  Extension_Int.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-22.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation
import Foundation

extension Int
{
    public func minutes() -> String
    {
        return String.init(format: "%d Minute(s)", self)
    }
}
