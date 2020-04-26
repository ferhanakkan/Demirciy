//
//  DFController.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit
import SnapKit

open class DFController: UIViewController {
    
    // MARK: - Properties
    public var dfViewModel: DFControllerViewModel!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        addSubviews()
        addConstraints()
        observe()
    }
}
