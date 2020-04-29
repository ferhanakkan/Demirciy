//
//  DBarButtonItem.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DBarButtonItem: UIBarButtonItem {}

// MARK: - Public Functions
public extension DBarButtonItem {
    
    convenience init(image: UIImage?, target: Any?, action: Selector?) {
        self.init(image: image, style: UIBarButtonItem.Style.done, target: target, action: action)
    }
}
