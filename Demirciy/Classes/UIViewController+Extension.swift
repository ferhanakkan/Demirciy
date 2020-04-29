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
        DLogManager.custom("Showing Controller: \(String(describing: self.classForCoder))")
        
        view.backgroundColor = UIColor.white
        hideKeyboardWhenTappedAround()
    }
    
    open func addSubviews() {}
    
    open func addConstraints() {
        view.layoutIfNeeded()
    }
    
    open func observe() {}
}

public extension UIViewController {
    
    var isViewActive: Bool {
        return view.window != nil
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
