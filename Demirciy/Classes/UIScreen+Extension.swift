//
//  UIScreen+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 23.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    var widescreenHeight: CGFloat {
        return UIScreen.main.bounds.width / DConstant.DUIConstant.widescreenRatio
    }
}
