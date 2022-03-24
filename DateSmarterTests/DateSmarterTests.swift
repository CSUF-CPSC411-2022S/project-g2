//
//  DateSmarterTests.swift
//  DateSmarterTests
//
//  Created by Nicholas Caro on 3/9/22.
//

import XCTest
@testable import DateSmarter

class DateSmarterTests: XCTestCase {

    func testNewUser(){
        let obj = logIn()
        XCTAssertTrue(obj.addNewUser(name: "John", password: "1234"))
    }
    func testAddingExistingUser(){
        let obj = logIn()
        XCTAssertFalse(obj.addNewUser(name: "Nicholas", password: "1234"))
    }
    
    func testEmptyNewUser(){
        let obj = logIn()
        XCTAssertFalse(obj.addNewUser(name: "", password: ""))
    }
    func testValidateExistingUser(){
        let obj = logIn()
        XCTAssertTrue(obj.checkUser(name: "Nicholas", password: "1234"))
    }
    func testValidNonExistingUser(){
        let obj = logIn()
        XCTAssertFalse(obj.checkUser(name: "John", password: "1234"))
    }
    
    func testPopUpNotifcationArray(){
        let obj = popUpNotif()
        XCTAssertEqual(obj.messageArray[0], "Try Again.")
    }

}
