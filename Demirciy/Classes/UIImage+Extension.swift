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
    
    var megabytesSize: Double {
        return Double(kilobytesSize) / 1024
    }
    
    func base64PNG() -> String? {
        return pngData()?.base64EncodedString()
    }
    
    func base64JPEG() -> String? {
        return jpegData(compressionQuality: 1)?.base64EncodedString()
    }
    
    class func fromBase64(_ base64: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else { return nil }
        return UIImage(data: imageData)
    }
    
    func compressedData(quality: CGFloat = 0.5) -> Data? {
        return jpegData(compressionQuality: quality)
    }
    
    func compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = compressedData(quality: quality) else { return nil }
        return UIImage(data: data)
    }
    
    func scaled(toHeight: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toHeight / size.height
        let newWidth = size.width * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: toHeight), opaque, 0)
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func scaled(toWidth: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toWidth / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: toWidth, height: newHeight), opaque, 0)
        draw(in: CGRect(x: 0, y: 0, width: toWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func resize(maxKB: Int, completion: @escaping(UIImage) -> Void) {
        if kilobytesSize < maxKB {
            completion(self)
            return
        }

        var resizingImage = self
        var quality: CGFloat = 1
        let reduceCounter: CGFloat = 0.2

        for _ in 0 ..< 10 {
            guard let resizedImage = resizingImage.compressed(quality: quality), quality > reduceCounter else {
                completion(resizingImage)
                return
            }
            resizingImage = resizedImage

            if resizingImage.kilobytesSize < maxKB {
                completion(resizingImage)
                return
            }

            quality -= reduceCounter
        }

        completion(resizingImage)
    }
}
