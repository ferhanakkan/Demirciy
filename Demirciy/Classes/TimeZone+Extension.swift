//
//  TimeZone+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 1.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

public extension TimeZone {
    
    var timezone: Int {
        return TimeZone.current.secondsFromGMT() / 3600
    }
}
