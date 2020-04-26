//
//  DFUIConstant.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension DFConstant {
    
    class DFUIConstant {
        
        public static let animationDurationNormal: TimeInterval = TimeInterval(0.3)
        public static let animationDurationFast: TimeInterval = TimeInterval(0.15)
        public static let animationDurationVeryFast: TimeInterval = TimeInterval(0.075)
        
        public static var safeAreaTopInset: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            } else {
                return 0
            }
        }
        public static var safeAreaBottomInset: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            } else {
                return 0
            }
        }
        
        public static let defaultTopOffset: CGFloat = DFConstant.DFUIConstant.safeAreaTopInset + 16
        public static let defaultBottomOffset: CGFloat = DFConstant.DFUIConstant.safeAreaBottomInset + 16
    }
}
