//
//  DNavigationController.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DNavigationController: UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initLocale()
        initTheme()
        addSubviews()
        addConstraints()
        observe()
    }
}
