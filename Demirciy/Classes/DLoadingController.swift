//
//  DLoadingController.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit
import SnapKit

open class DLoadingController: DController {
    
    // MARK: - Properties
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    open override func initUI() {
        super.initUI()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }

    open override func addSubviews() {
        super.addSubviews()
        
        view.addSubview(indicator)
    }

    open override func addConstraints() {
        super.addConstraints()
        
        indicator.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.height.width.equalTo(96)
        }
        
        view.layoutIfNeeded()
    }
}
