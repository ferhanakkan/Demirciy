//
//  DLanguageManagerTests.swift
//  DemirciyTests
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import XCTest
import Demirciy

class DLanguageManagerTests: XCTestCase {

    func testLocalized() {
        DLanguageManager.shared.changeLanguage("en")
        XCTAssertEqual("DGeneral_all".localized(), "All")
        
        DLanguageManager.shared.changeLanguage("tr")
        XCTAssertEqual("DGeneral_all".localized(), "Hepsi")
    }
}
