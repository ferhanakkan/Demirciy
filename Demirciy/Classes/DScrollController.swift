//
//  DScrollController.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 2.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DScrollController: DController {
    
    // MARK: - UI Properties
    public let scroll: DScroll = DScroll()
    
    open override func addSubviews() {
        super.addSubviews()
        
        addSubviews([scroll])
    }
    
    open override func addConstraints() {
        super.addConstraints()
        
        scroll.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        view.layoutIfNeeded()
    }
}
