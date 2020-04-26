//
//  DFCameraManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import AVKit
//import PromiseKit

public class DFCameraManager: NSObject {
    
    // MARK: - Properties
    public static let shared: DFCameraManager = DFCameraManager()
    
    public var didDismiss: ((_ image: UIImage?) -> Void)?
    private let imagePickerController = UIImagePickerController()
    private var isShowing: Bool = false
    
    private override init() {
        super.init()
        
        imagePickerController.delegate = self
    }
}

// MARK: - UINavigationControllerDelegate
extension DFCameraManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image: UIImage?

        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = editedImage
        }

        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = originalImage
        }
        
        dismissCamera(image: image)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissCamera(image: nil)
    }
}

// MARK: - Public Functions
public extension DFCameraManager {
    
    func isCameraEnabled(for mediaType: AVMediaType = AVMediaType.video ) -> Bool {
        return AVCaptureDevice.authorizationStatus(for: mediaType) == AVAuthorizationStatus.authorized
    }
    
    func requestAccess(mediaType: AVMediaType = AVMediaType.video, completion: @escaping(_ isGranted: Bool) -> Void = { _ in }) {
        AVCaptureDevice.requestAccess(for: mediaType) { (isGranted) in
            completion(isGranted)
        }
    }
    
//    func requestAccessWithPromise(mediaType: AVMediaType = AVMediaType.video) -> Promise<Bool> {
//        let (promise, seal) = Promise<Bool>.pending()
//        
//        AVCaptureDevice.requestAccess(for: mediaType) { (isGranted) in
//            seal.fulfill(isGranted)
//        }
//        
//        return promise
//    }
    
    func showCamera(controller: UIViewController) {
        if isShowing { return }
        isShowing = true
        
        imagePickerController.sourceType = UIImagePickerController.SourceType.camera
        
        show(controller: controller)
    }
    
    func showLibrary(controller: UIViewController) {
        if isShowing { return }
        isShowing = true
        
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        show(controller: controller)
    }
    
    func cameraDeniedErrorAlert(controller: UIViewController?, confirmCompletion: @escaping() -> Void = {}, cancelCompletion: @escaping() -> Void = {}) {
        DFAlertManager.showConfirm(title: "DFGeneral_cameraPermissionDeniedAlertTitle".localized(), message: "DFGeneral_cameraPermissionDeniedAlertMessage".localized(), confirmButtonTitle: "DFGeneral_cameraPermissionDeniedAlertGoSettings".localized(), controller: controller, confirmAction: {
            confirmCompletion()
            DFAppManager.shared.showAppSettings()
        }) {
            cancelCompletion()
        }
    }
}

// MARK: - Private Functions
private extension DFCameraManager {
    
    func show(controller: UIViewController) {
        controller.present(imagePickerController, animated: true, completion: nil)
    }
    
    func dismissCamera(image: UIImage?) {
        imagePickerController.dismiss(animated: true) {
            self.isShowing = false
            self.didDismiss?(image)
        }
    }
}