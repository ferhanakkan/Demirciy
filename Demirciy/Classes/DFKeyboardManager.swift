//
//  DFKeyboardManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DFKeyboardManager {
    
    // MARK: - Properties
    public static let shared: DFKeyboardManager = DFKeyboardManager()
    
    public var keyboardWillShow: ((DFKeyboardModel) -> Void)?
    public var keyboardWillHide: ((DFKeyboardModel) -> Void)?
    public private(set) var isKeyboardOpen: Bool = false
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Actions
private extension DFKeyboardManager {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        DFKeyboardManager.shared.isKeyboardOpen = true
        
        let keyboardModel: DFKeyboardModel = DFKeyboardModel()
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            keyboardModel.height = keyboardFrame.cgRectValue.height
        }
        
        if let keyboardAnimationDuration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardModel.animationDuration = keyboardAnimationDuration
        }
        
        DFKeyboardManager.shared.keyboardWillShow?(keyboardModel)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        DFKeyboardManager.shared.isKeyboardOpen = false
        
        let keyboardModel: DFKeyboardModel = DFKeyboardModel()
        
        if let keyboardAnimationDuration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardModel.animationDuration = keyboardAnimationDuration
        }
        
        DFKeyboardManager.shared.keyboardWillHide?(keyboardModel)
    }
}
