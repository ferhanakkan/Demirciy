//
//  DWebController.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 9.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit
import WebKit

open class DWebController: DController {
    
    // MARK: - UI Properties
    public let web: DWeb = DWeb()
    
    open override func addSubviews() {
        super.addSubviews()
        
        addSubviews([web])
    }
    
    open override func addConstraints() {
        super.addConstraints()
        
        web.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        view.layoutIfNeeded()
    }
}
