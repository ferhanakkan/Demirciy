//
//  UIFont+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UIFont {
    
    class func extraSmall() -> UIFont {
        return UIFont.systemFont(ofSize: 11)
    }
    
    class func small() -> UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    class func medium() -> UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    class func large() -> UIFont {
        return UIFont.systemFont(ofSize: 22)
    }
    
    class func extraLarge() -> UIFont {
        return UIFont.systemFont(ofSize: 34)
    }
}
