//
//  DControllerViewModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 25.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

open class DControllerViewModel: DModel {
    
    // MARK: - Properties
    public var isViewDidAppearBefore: Bool = false
    public var isNeedToRefresh: Bool = false
    
    public override init() {
        super.init()
    }
}
