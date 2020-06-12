//
//  UICollectionReusableView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 1.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self.self)
    }
}
