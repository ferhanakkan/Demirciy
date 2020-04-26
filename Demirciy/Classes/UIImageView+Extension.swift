//
//  UIImageView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    func download(_ urlPath: String) {
        guard let url = URL(string: urlPath) else {
            DFLogManager.e("Invalid url: \(urlPath)")
            return
        }
        
        download(url)
    }
    
    func download(_ url: URL) {
        clipsToBounds = true
        
        kf.setImage(with: url, options: [KingfisherOptionsInfoItem.transition(ImageTransition.fade(DFConstant.DFUIConstant.animationDurationFast))])
    }
}

