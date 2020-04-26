//
//  UIImage+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 25.03.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    var bytesSize: Int {
        return jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    var kilobytesSize: Int {
        return bytesSize / 1024
    }
    
    func base64PNG() -> String? {
        return pngData()?.base64EncodedString()
    }
    
    func base64JPEG() -> String? {
        return jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
