//
//  DCameraManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import AVKit
import PromiseKit

public class DCameraManager: NSObject {
    
    // MARK: - Properties
    public static let shared: DCameraManager = DCameraManager()
    
    public var didDismiss: ((_ image: UIImage?) -> Void)?
    private let imagePickerController: DImagePickerController = DImagePickerController()
    
    private override init() {
        super.init()
        
        imagePickerController.delegate = self
    }
}

// MARK: - UINavigationControllerDelegate
extension DCameraManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image: UIImage?

        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = originalImage
        }
        
        dismissCamera(image: image)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissCamera(image: nil)
    }
}

// MARK: - Public Functions
public extension DCameraManager {
    
    func isCameraEnabled(for mediaType: AVMediaType = AVMediaType.video ) -> Bool {
        return AVCaptureDevice.authorizationStatus(for: mediaType) == AVAuthorizationStatus.authorized
    }
    
    func requestAccess(mediaType: AVMediaType = AVMediaType.video, completion: @escaping(_ isGranted: Bool) -> Void = { _ in }) {
        AVCaptureDevice.requestAccess(for: mediaType) { (isGranted) in
            completion(isGranted)
        }
    }
    
    func requestAccessWithPromise(mediaType: AVMediaType = AVMediaType.video) -> Promise<Bool> {
        let (promise, seal) = Promise<Bool>.pending()
        
        AVCaptureDevice.requestAccess(for: mediaType) { (isGranted) in
            seal.fulfill(isGranted)
        }
        
        return promise
    }
    
    func showCamera(controller: UIViewController, allowsEditing: Bool = false) {
        imagePickerController.sourceType = UIImagePickerController.SourceType.camera
        imagePickerController.allowsEditing = allowsEditing
        
        show(controller: controller)
    }
    
    func showLibrary(controller: UIViewController, allowsEditing: Bool = false) {
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.allowsEditing = allowsEditing
        
        show(controller: controller)
    }
    
    func cameraDeniedErrorAlert(controller: UIViewController?, confirmCompletion: @escaping() -> Void = {}, cancelCompletion: @escaping() -> Void = {}) {
        DAlertManager.showConfirm(title: "DGeneral_cameraPermissionDeniedAlertTitle".dLocalized(), message: "DGeneral_cameraPermissionDeniedAlertMessage".dLocalized(), confirmButtonTitle: "DGeneral_cameraPermissionDeniedAlertGoSettings".dLocalized(), controller: controller, confirmAction: {
            confirmCompletion()
            DAppManager.showAppSettings()
        }) {
            cancelCompletion()
        }
    }
}

// MARK: - Private Functions
private extension DCameraManager {
    
    func show(controller: UIViewController) {
        controller.present(imagePickerController, animated: true, completion: nil)
    }
    
    func dismissCamera(image: UIImage?) {
        imagePickerController.dismiss(animated: true) {
            self.didDismiss?(image)
        }
    }
}
