//
//  DFAlertManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DFAlertManager {}

// MARK: - Public Functions
public extension DFAlertManager {
    
    class func showNotice(title: String? = nil, message: String? = nil, okButtonTitle: String = "DFAlertManager_ok".localized(bundle: Bundle(for: DFAlertManager.self)), controller: UIViewController?, okAction: @escaping() -> Void = {}) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.cancel) { (_) in
            okAction()
        }
        alertController.addAction(okAction)
        
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    class func showError(title: String? = "DFGeneral_error".localized(bundle: Bundle(for: DFAlertManager.self)), message: String?, okButtonTitle: String = "DFlertManager_ok".localized(bundle: Bundle(for: DFAlertManager.self)), controller: UIViewController?, okAction: @escaping() -> Void = {}) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.cancel) { (_) in
            okAction()
        }
        alertController.addAction(okAction)
        
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    class func showConfirm(title: String? = nil, message: String? = nil, confirmButtonTitle: String = "DFAlertManager_confirm".localized(bundle: Bundle(for: DFAlertManager.self)), cancelButtonTitle: String = "DFAlertManager_cancel".localized(bundle: Bundle(for: DFAlertManager.self)), controller: UIViewController?, confirmAction: @escaping() -> Void = {}, cancelAction: @escaping() -> Void = {}) {
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
        
        let cancelAction = UIAlertAction(title: "DFAlertManager_cancel".localized(), style: UIAlertAction.Style.cancel) { (_) in
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
