//
//  DStackView.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DStackView: UIStackView {
    
    public convenience init(alignment: UIStackView.Alignment = UIStackView.Alignment.fill, distribution: UIStackView.Distribution = UIStackView.Distribution.fillEqually, axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(frame: CGRect.zero)
        
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
    }
}

// MARK: - Public Functions
public extension DStackView {
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }
}
