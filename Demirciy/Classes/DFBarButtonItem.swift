//
//  DFBarButtonItem.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DFBarButtonItem: UIBarButtonItem {}

// MARK: - Public Functions
public extension DFBarButtonItem {
    
    convenience init(image: UIImage?, target: Any?, action: Selector?) {
        self.init(image: image, style: UIBarButtonItem.Style.done, target: target, action: action)
    }
}
