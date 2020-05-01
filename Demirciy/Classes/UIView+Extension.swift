//
//  UIView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

@objc extension UIView {
    
    open func initUI() {}
    
    open func addSubviews() {}
    
    open func addConstraints() {}
    
    open func observe() {}
}

public extension UIView {
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: CGRect.zero)
        
        self.backgroundColor = backgroundColor
    }
    
    func addCornerRadius(_ radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    func circle() {
        clipsToBounds = true
        layer.cornerRadius = min(frame.width, frame.height) / 2
    }
    
    func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
