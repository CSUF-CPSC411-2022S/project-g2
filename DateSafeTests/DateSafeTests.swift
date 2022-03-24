//
//  DateSafeTests.swift
//  DateSafeTests
//
//  Created by Wangmo Tenzing on 2/23/22.
//

import XCTest
@testable import DateSafe

class DateSafeTests: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //This function tests if the user notification is not empty.
    func testUserNotificationInitializedWithParameter() {
        let notificationManager = Notifications("Hello")
        XCTAssertNotNil(notificationManager)
        }
    
    //This function tests if the notifications sent to others is not empty
    func testInitializedNotificationsSentToOthers() {
        let notificationManager = ContactOthers("Hello", to: "Random")
        XCTAssertNotNil(notificationManager)
    }
    
    //This function tests if the user notification is empty
    func testUserNotificationInitializedWithoutParameter() {
        let notificationManager = Notifications("")
        XCTAssertNil(notificationManager)
        }
    
    //This function tests if the notifications sent to others is empty and not sent to anyone
    func testInitializedNotificationsNotSentToOthers() {
        let notificationManager = ContactOthers("", to: "")
        XCTAssertNil(notificationManager)
    }
    
    
    
    
            
        
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
