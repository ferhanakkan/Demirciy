//
//  DCollectionCell.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DCollectionCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        initLocale()
        initTheme()
        addSubviews()
        addConstraints()
        observe()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
