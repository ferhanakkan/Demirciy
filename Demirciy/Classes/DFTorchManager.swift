//
//  DFTorchManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 22.03.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import AVKit

public class DFTorchManager {}

// MARK: - Public Functions
public extension DFTorchManager {
    
    class func changeState() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video), videoCaptureDevice.hasTorch else { return }
        
        do {
            try videoCaptureDevice.lockForConfiguration()
            
            if videoCaptureDevice.torchMode == AVCaptureDevice.TorchMode.on {
                DFTorchManager.close()
            } else {
                DFTorchManager.open()
            }
            
            videoCaptureDevice.unlockForConfiguration()
        } catch let error {
            DFLogManager.e(error)
        }
    }
    
    class func open() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video), videoCaptureDevice.hasTorch else { return }
        
        do {
            try videoCaptureDevice.lockForConfiguration()
            
            do {
                try videoCaptureDevice.setTorchModeOn(level: 1.0)
            } catch let error {
                DFLogManager.e(error)
            }
            
            videoCaptureDevice.unlockForConfiguration()
        } catch let error {
            DFLogManager.e(error)
        }
    }
    
    class func close() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video), videoCaptureDevice.hasTorch else { return }
        
        do {
            try videoCaptureDevice.lockForConfiguration()
            
            videoCaptureDevice.torchMode = AVCaptureDevice.TorchMode.off
            
            videoCaptureDevice.unlockForConfiguration()
        } catch let error {
            DFLogManager.e(error)
        }
    }
    
}
