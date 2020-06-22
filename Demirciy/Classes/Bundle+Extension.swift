//
//  Bundle+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 17.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var version: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var build: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
