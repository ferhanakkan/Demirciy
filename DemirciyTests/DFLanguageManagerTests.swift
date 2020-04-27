//
//  DFLanguageManagerTests.swift
//  DemirciyTests
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import XCTest
import Demirciy

class DFLanguageManagerTests: XCTestCase {

    func testLocalized() {
        XCTAssertEqual("DFGeneral_all".localized(), "All")
    }
}
