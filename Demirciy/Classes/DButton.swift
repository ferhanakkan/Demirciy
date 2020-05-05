//
//  DButton.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DButton: UIButton {}

// MARK: - Public Functions
public extension DButton {
    
    func title(title: String? = nil, titleColor: UIColor = UIColor.black) -> DButton {
        setTitle(title, for: UIControl.State.normal)
        setTitleColor(titleColor, for: UIControl.State.normal)
        return self
    }
}
