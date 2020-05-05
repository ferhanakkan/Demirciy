//
//  DLanguageManagerTests.swift
//  DemirciyTests
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import XCTest
@testable import Demirciy
@testable import RxLocalizer

class DLanguageManagerTests: XCTestCase {

    func testLocalized() {
        Localizer.shared.changeLanguage.accept("en")
        XCTAssertEqual("DGeneral_all".dLocalized(), "All")
        
        Localizer.shared.changeLanguage.accept("tr")
        XCTAssertEqual("DGeneral_all".dLocalized(), "Hepsi")
    }
}
