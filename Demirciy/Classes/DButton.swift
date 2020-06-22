//
//  DButton.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DButton: UIButton {}

// MARK: - Public Functions
public extension DButton {
    
    func title(title: String? = nil, titleColor: UIColor = UIColor.black) -> DButton {
        setTitle(title, for: UIControl.State.normal)
        setTitleColor(titleColor, for: UIControl.State.normal)
        return self
    }
    
    func image(imageName: String? = nil, tintColor: UIColor = UIColor.black, imageContentMode: UIView.ContentMode = UIView.ContentMode.scaleAspectFit, insets: UIEdgeInsets = UIEdgeInsets.zero) -> DButton {
        setImage(imageName?.image(), for: UIControl.State.normal)
        imageView?.tintColor = tintColor
        imageView?.contentMode = imageContentMode
        imageEdgeInsets = insets
        return self
    }
    
    func font(name: String, size: CGFloat) -> DButton {
        titleLabel?.font = UIFont(name: name, size: size)
        return self
    }
    
    func font(_ font: UIFont) -> DButton {
        titleLabel?.font = font
        return self
    }
    
    func tapAnimation(_ completionBlock: @escaping() -> Void = {}) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                        self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}
