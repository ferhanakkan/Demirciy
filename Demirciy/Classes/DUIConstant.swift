//
//  DUIConstant.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension DConstant {
    
    class DUIConstant {
        
        public static let animationDurationNormal: TimeInterval = TimeInterval(0.3)
        public static let animationDurationFast: TimeInterval = TimeInterval(0.15)
        public static let animationDurationVeryFast: TimeInterval = TimeInterval(0.075)
        
        public static var safeAreaTopInset: CGFloat {
            return DAppManager.shared.keyWindow?.safeAreaInsets.top ?? 0
        }
        public static var safeAreaBottomInset: CGFloat {
            return DAppManager.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        
        public static let defaultTopOffset: CGFloat = DConstant.DUIConstant.safeAreaTopInset + 16
        public static let defaultBottomOffset: CGFloat = DConstant.DUIConstant.safeAreaBottomInset + 16
        
        public static let widescreenSize: CGSize = CGSize(width: 16, height: 9)
        public static let widescreenRatio: CGFloat = 16 / 9
    }
}
