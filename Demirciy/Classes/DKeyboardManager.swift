//
//  DKeyboardManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DKeyboardManager {
    
    // MARK: - Properties
    public static let shared: DKeyboardManager = DKeyboardManager()
    
    public var keyboardWillShow: ((DKeyboardModel) -> Void)?
    public var keyboardWillHide: ((DKeyboardModel) -> Void)?
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
private extension DKeyboardManager {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        DKeyboardManager.shared.isKeyboardOpen = true
        
        let keyboardModel: DKeyboardModel = DKeyboardModel()
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            keyboardModel.height = keyboardFrame.cgRectValue.height
        }
        
        if let keyboardAnimationDuration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardModel.animationDuration = keyboardAnimationDuration
        }
        
        DKeyboardManager.shared.keyboardWillShow?(keyboardModel)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        DKeyboardManager.shared.isKeyboardOpen = false
        
        let keyboardModel: DKeyboardModel = DKeyboardModel()
        
        if let keyboardAnimationDuration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardModel.animationDuration = keyboardAnimationDuration
        }
        
        DKeyboardManager.shared.keyboardWillHide?(keyboardModel)
    }
}
