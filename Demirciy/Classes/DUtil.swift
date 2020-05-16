//
//  DUtil.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DUtil {}

// MARK: - Public Functions
public extension DUtil {
    
    class func printSupportedFonts() {
        for familyName in UIFont.familyNames.sorted() {
            print("------------------------------")
            print("Font Family Name = [\(familyName)\\n]")
            print("Font Names = [\(UIFont.fontNames(forFamilyName: familyName))\\n]")
            print("------------------------------")
        }
    }
    
    class func isAppInstalled(_ app: DAppType) -> Bool {
        var schemeName = ""
        
        switch app {
        case DAppType.facebook:
            schemeName = DConstant.DAppConstant.facebookSchemeName
        case DAppType.twitter:
            schemeName = DConstant.DAppConstant.twitterSchemeName
        case DAppType.instagram:
            schemeName = DConstant.DAppConstant.instagramSchemeName
        case DAppType.googleMaps:
            schemeName = DConstant.DAppConstant.googleMapsSchemeName
        case DAppType.yandex:
            schemeName = DConstant.DAppConstant.yandexSchemeName
        }
        
        if let url = URL(string: "\(schemeName)://"), UIApplication.shared.canOpenURL(url) {
            return true
        }
        
        return false
    }
    
    class func openApp(_ app: DAppType, parameter: String? = nil) {
        guard isAppInstalled(app) else { return }
        
        var schemeName = ""
        
        switch app {
        case DAppType.facebook:
            schemeName = DConstant.DAppConstant.facebookSchemeName
        case DAppType.twitter:
            schemeName = DConstant.DAppConstant.twitterSchemeName
        case DAppType.instagram:
            schemeName = DConstant.DAppConstant.instagramSchemeName
        case DAppType.googleMaps:
            schemeName = DConstant.DAppConstant.googleMapsSchemeName
        case DAppType.yandex:
            schemeName = DConstant.DAppConstant.yandexSchemeName
        }
        
        guard let url = URL(string: "\(schemeName)://\(parameter ?? "")"), UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    class func randomString(length: Int) -> String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
