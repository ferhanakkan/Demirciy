//
//  DCollectionController.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DCollectionController: UICollectionViewController {
    
    // MARK: - Properties
    public var dViewModel: DControllerViewModel!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        addSubviews()
        addConstraints()
        observe()
    }
}
