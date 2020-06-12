//
//  DTextField.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DTextField: UITextField {}

// MARK: - Public Functions
public extension DTextField {
    
    func font(name: String, size: CGFloat) -> DTextField {
        font = UIFont(name: name, size: size)
        return self
    }
    
    func placeholder(placeholder: String?, color: UIColor? = nil) -> DTextField {
        if let placeholder = placeholder, let color = color {
            let attributedString = DAttributedString(string: placeholder)
            if let font = font {
                attributedString.font = font
            }
            attributedString.color = color
            
            attributedPlaceholder = attributedString.attributedString
        } else {
            self.placeholder = placeholder
        }
        
        return self
    }
    
    func text(text: String? = nil, textColor: UIColor = UIColor.black) -> DTextField {
        self.text = text
        self.textColor = textColor
        return self
    }
    
    func center() -> DTextField {
        textAlignment = NSTextAlignment.center
        return self
    }
}
