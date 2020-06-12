//
//  DNavigationManager.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 8.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DNavigationManager {}

// MARK: - Public Functions
public extension DNavigationManager {
    
    class func setRootViewController(window: UIWindow, controller: UIViewController, animationOptions: DTransitionOptions? = nil) {
        if let animationOptions = animationOptions {
            window.layer.add(animationOptions.animation, forKey: kCATransition)
        }
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}

// MARK: - DTransitionOptions
public struct DTransitionOptions {
    
    public enum DCurve {
        case linear
        case easeIn
        case easeOut
        case easeInOut
        
        internal var function: CAMediaTimingFunction {
            let key: String!
            
            switch self {
            case .linear:
                key = CAMediaTimingFunctionName.linear.rawValue
            case .easeIn:
                key = CAMediaTimingFunctionName.easeIn.rawValue
            case .easeOut:
                key = CAMediaTimingFunctionName.easeOut.rawValue
            case .easeInOut:
                key = CAMediaTimingFunctionName.easeInEaseOut.rawValue
            }
            return CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: key))
        }
    }
    
    public enum DDirection {
        case fade
        case toTop
        case toBottom
        case toLeft
        case toRight
        
        internal func transition() -> CATransition {
            let transition = CATransition()
            transition.type = CATransitionType.push
            switch self {
            case .fade:
                transition.type = CATransitionType.fade
                transition.subtype = nil
            case .toLeft:
                transition.subtype = CATransitionSubtype.fromLeft
            case .toRight:
                transition.subtype = CATransitionSubtype.fromRight
            case .toTop:
                transition.subtype = CATransitionSubtype.fromTop
            case .toBottom:
                transition.subtype = CATransitionSubtype.fromBottom
            }
            return transition
        }
    }
    
    public var duration: TimeInterval = DConstant.DUIConstant.animationDurationNormal
    public var direction: DTransitionOptions.DDirection = .fade
    public var style: DTransitionOptions.DCurve = .linear
    
    public init(direction: DTransitionOptions.DDirection = .fade, style: DTransitionOptions.DCurve = .linear) {
        self.direction = direction
        self.style = style
    }
    
    public init() { }
    
    internal var animation: CATransition {
        let transition = self.direction.transition()
        transition.duration = self.duration
        transition.timingFunction = self.style.function
        return transition
    }
}
