//
//  DImageView.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 27.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DImageView: UIImageView {}

// MARK: - Public Functions
public extension DImageView {
    
    func image(imageName: String, tintColor: UIColor = UIColor.black) -> DImageView {
        self.image = imageName.image()
        self.tintColor = tintColor
        return self
    }
}
