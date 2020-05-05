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
    
    public init(viewModel: DControllerViewModel? = nil) {
        self.dViewModel = viewModel
        
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        addSubviews()
        addConstraints()
        observe()
    }
}
