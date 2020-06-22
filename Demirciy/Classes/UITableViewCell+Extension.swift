//
//  UITableViewCell+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 22.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self.self)
    }
}
