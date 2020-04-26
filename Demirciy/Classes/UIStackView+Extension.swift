//
//  UIStackView+Extensions.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 1.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    func removeArrangedSubviews() {
        arrangedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
