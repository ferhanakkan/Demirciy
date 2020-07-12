//
//  DImageView.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 27.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit
import SnapKit

open class DImageView: UIImageView {
    
    // MARK: - Properties
    public var maskView_: UIView?
}

// MARK: - Public Functions
public extension DImageView {
    
    func image(imageName: String, tintColor: UIColor? = nil, insets: UIEdgeInsets = UIEdgeInsets.zero) -> DImageView {
        self.image = imageName.image()?.withAlignmentRectInsets(insets)
        if let tintColor_ = tintColor {
            self.tintColor = tintColor_
        }
        return self
    }
    
    func contentMode(_ mode: UIView.ContentMode) -> DImageView {
        contentMode = mode
        return self
    }
    
    func addMaskView(_ view: UIView) -> DImageView {
        removeMaskView()
        
        addSubviews([view])
        
        view.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        maskView_ = view
        
        return self
    }
    
    func removeMaskView() {
        maskView_?.removeFromSuperview()
        maskView_ = nil
    }
}
