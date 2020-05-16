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
    
    open func initLocale() {}
    
    open func initTheme() {}
    
    open func addSubviews() {}
    
    open func addConstraints() {}
    
    open func observe() {}
}

public extension UIView {
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: CGRect.zero)
        
        self.backgroundColor = backgroundColor
    }
    
    func addSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addSubview(subview)
        }
    }
    
    func cornerRadius(_ radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    func cornerRadiusSpecific(corners: UIRectCorner, size: CGSize) {
        let shape = CAShapeLayer()
        shape.bounds = frame
        shape.position = center
        shape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size).cgPath
        layer.mask = shape
    }
    
    func circle() {
        clipsToBounds = true
        layer.cornerRadius = min(frame.width, frame.height) / 2
    }
    
    func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func shadow() {
        layer.masksToBounds = false
        let space: CGFloat = 4
        let shadowRect = CGRect(x: -space, y: -(space / 2), width: bounds.width + (2 * space), height: bounds.height + (2 * space))
        layer.shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.05
    }
}
