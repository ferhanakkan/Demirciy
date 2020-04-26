//
//  DFCollectionReusableView.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DFCollectionReusableView: UICollectionReusableView {
    
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