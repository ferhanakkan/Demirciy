//
//  DFUtil.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DFUtil {}

// MARK: - Public Functions
public extension DFUtil {
    
    class func printSupportedFonts() {
        for familyName in UIFont.familyNames.sorted() {
            print("------------------------------")
            print("Font Family Name = [\(familyName)\\n]")
            print("Font Names = [\(UIFont.fontNames(forFamilyName: familyName))\\n]")
            print("------------------------------")
        }
    }
    
    class func isAppInstalled(_ app: DFAppType) -> Bool {
        var schemeName = ""
        
        switch app {
        case DFAppType.facebook:
            schemeName = DFConstant.DFAppConstant.facebookSchemeName
        case DFAppType.twitter:
            schemeName = DFConstant.DFAppConstant.twitterSchemeName
        case DFAppType.instagram:
            schemeName = DFConstant.DFAppConstant.instagramSchemeName
        case DFAppType.googleMaps:
            schemeName = DFConstant.DFAppConstant.googleMapsSchemeName
        case DFAppType.yandex:
            schemeName = DFConstant.DFAppConstant.yandexSchemeName
        }
        
        if let url = URL(string: "\(schemeName)://"), UIApplication.shared.canOpenURL(url) {
            return true
        }
        
        return false
    }
    
    class func openApp(_ app: DFAppType, parameter: String? = nil) {
        guard isAppInstalled(app) else { return }
        
        var schemeName = ""
        
        switch app {
        case DFAppType.facebook:
            schemeName = DFConstant.DFAppConstant.facebookSchemeName
        case DFAppType.twitter:
            schemeName = DFConstant.DFAppConstant.twitterSchemeName
        case DFAppType.instagram:
            schemeName = DFConstant.DFAppConstant.instagramSchemeName
        case DFAppType.googleMaps:
            schemeName = DFConstant.DFAppConstant.googleMapsSchemeName
        case DFAppType.yandex:
            schemeName = DFConstant.DFAppConstant.yandexSchemeName
        }
        
        guard let url = URL(string: "\(schemeName)://\(parameter ?? "")"), UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
