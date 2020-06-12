//
//  UIViewController+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

@objc extension UIViewController {
    
    open func initUI() {
        DLogManager.custom("Showing Controller: \(screenName)")
        
        view.backgroundColor = UIColor.white
        hideKeyboardWhenTappedAround()
    }
    
    open func initLocale() {}
    
    open func initTheme() {}
    
    open func addSubviews() {}
    
    open func addConstraints() {}
    
    open func observe() {}
}

public extension UIViewController {
    
    var screenName: String {
        return String(describing: self.classForCoder)
    }
    
    var isViewActive: Bool {
        return view.window != nil
    }
    
    func addSubviews(_ subviews: [UIView]) {
        view.addSubviews(subviews)
    }
}

private extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        recognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
