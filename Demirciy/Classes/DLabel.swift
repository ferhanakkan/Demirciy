//
//  DLabel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DLabel: UILabel {}

// MARK: - Public Functions
public extension DLabel {
    
    func text(text: String? = nil, textColor: UIColor = UIColor.black) -> DLabel {
        self.text = text
        self.textColor = textColor
        return self
    }
    
    func center() -> DLabel {
        self.textAlignment = NSTextAlignment.center
        return self
    }
}
