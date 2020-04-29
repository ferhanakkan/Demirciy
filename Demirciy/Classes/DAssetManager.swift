//
//  DAssetManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DAssetManager {}

// MARK: - Public String Extensions
public extension String {
    
    func image(bundle: Bundle? = nil) -> UIImage? {
        if let bundle = bundle {
            return UIImage(named: self, in: bundle, compatibleWith: nil)
        }
        
        var localizedImage: UIImage?
        
        if let localizedBaseImage = UIImage(named: self, in: Bundle(for: DAssetManager.self), compatibleWith: nil) {
            localizedImage = localizedBaseImage
        }
        
        if let localizedMainImage = UIImage(named: self, in: Bundle.main, compatibleWith: nil) {
            localizedImage = localizedMainImage
        }
        
        return localizedImage
    }
}
