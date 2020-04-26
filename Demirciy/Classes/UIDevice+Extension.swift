//
//  UIDevice+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var isSimulator: Bool {
        var isSim = false
        
        #if arch(i386) || arch(x86_64)
        isSim = true
        #endif
        
        return isSim
    }
}
