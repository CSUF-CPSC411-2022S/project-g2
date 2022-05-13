//
//  LocationTrackingUnitTests.swift
//  DateSmarterTests
//
//  Created by Wangmo Tenzing on 3/10/22.
//

import XCTest
@testable import DateSmarter

class LocationTrackingTests: XCTestCase {

    func testLocationTracking() {
        let location = LocationTracking()
        location.trackLocation(35, at: 110)
        
        XCTAssertEqual(location.latitude, 45)
        XCTAssertEqual(location.longitude, 100)
       
        
    }
}
