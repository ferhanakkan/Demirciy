//
//  DFView.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DFView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        addSubviews()
        addConstraints()
        observe()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Functions
public extension DFView {
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: CGRect.zero)
        
        self.backgroundColor = backgroundColor
    }
}
