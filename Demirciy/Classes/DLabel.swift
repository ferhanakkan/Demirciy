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
    
    func font(name: String, size: CGFloat) -> DLabel {
        font = UIFont(name: name, size: size)
        return self
    }
    
    func font(_ font: UIFont) -> DLabel {
        self.font = font
        return self
    }
    
    func align(_ alignment: NSTextAlignment) -> DLabel {
        textAlignment = alignment
        return self
    }
    
    func center() -> DLabel {
        textAlignment = NSTextAlignment.center
        return self
    }
    
    func infiniteLine() -> DLabel {
        numberOfLines = 0
        return self
    }
    
    func line(count: Int) -> DLabel {
        numberOfLines = count
        return self
    }
    
    func fit(minimumScaleFactor: CGFloat? = nil) -> DLabel {
        adjustsFontSizeToFitWidth = true
        if let factor = minimumScaleFactor {
            self.minimumScaleFactor = factor
        }
        return self
    }
}
