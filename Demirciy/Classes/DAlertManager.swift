//
//  DAlertManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DAlertManager {}

// MARK: - Public Functions
public extension DAlertManager {
    
    class func showNotice(title: String? = nil, message: String? = nil, okButtonTitle: String = "DAlertManager_ok".dLocalized(), controller: UIViewController?, okAction: @escaping() -> Void = {}) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.cancel) { (_) in
            okAction()
        }
        alertController.addAction(okAction)
        
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    class func showError(errorModel: DErrorModel, title: String? = "DGeneral_error".dLocalized(), okButtonTitle: String = "DAlertManager_ok".dLocalized(), controller: UIViewController?, okAction: @escaping() -> Void = {}) {
        let alertController: UIAlertController = UIAlertController(title: title, message: errorModel.message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.cancel) { (_) in
            okAction()
        }
        alertController.addAction(okAction)
        
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    class func showConfirm(title: String? = nil, message: String? = nil, confirmButtonTitle: String = "DAlertManager_confirm".dLocalized(), cancelButtonTitle: String = "DAlertManager_cancel".dLocalized(), controller: UIViewController?, confirmAction: @escaping() -> Void = {}, cancelAction: @escaping() -> Void = {}) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let confirmAction: UIAlertAction = UIAlertAction(title: confirmButtonTitle, style: UIAlertAction.Style.default) { (_) in
            confirmAction()
        }
        alertController.addAction(confirmAction)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: cancelButtonTitle, style: UIAlertAction.Style.cancel) { (_) in
            cancelAction()
        }
        alertController.addAction(cancelAction)
        
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    class func showSheet(title: String? = nil, message: String? = nil, items: [String], controller: UIViewController?, selectionCompletion: @escaping(_ selectedIndex: Int, _ selectedItem: String) -> Void, cancelCompletion: @escaping() -> Void = {}) {
        let sheetController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        
        let cancelAction = UIAlertAction(title: "DAlertManager_cancel".dLocalized(), style: UIAlertAction.Style.cancel) { (_) in
            cancelCompletion()
        }
        sheetController.addAction(cancelAction)
        
        for (index, item) in items.enumerated() {
            let action = UIAlertAction(title: item, style: UIAlertAction.Style.default) { action -> Void in
                selectionCompletion(index, item)
            }
            sheetController.addAction(action)
        }
        
        controller?.present(sheetController, animated: true, completion: nil)
    }
}
