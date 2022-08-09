//
//  EPSTests.swift
//  
//
//  Created by André Rohrbeck on 07.08.22.
//

import XCTest
@testable import EN13715

final class EPSTests: XCTestCase {

    let maxWidthFlange = EPSRunningSurface(e: 32.5, slopePercent: 15, wheelWidth: 140)
    let minWidthFlange = EPSRunningSurface(e: 28.5, slopePercent: 6.7, wheelWidth: 135)

    func testJm() {
        XCTAssertEqual(maxWidthFlange.Jm, CGPoint(x: -6.5, y: 100.871))
        XCTAssertEqual(minWidthFlange.Jm, CGPoint(x: -6.5, y: 100.871))
    }


    func testJm1() {
        XCTAssertEqual(maxWidthFlange.Jm1, CGPoint(x: 19.0, y: 329.453))
        XCTAssertEqual(minWidthFlange.Jm1, CGPoint(x: 19.0, y: 329.453))
    }


    func testC1b() {
        XCTAssertEqual(maxWidthFlange.C1b, CGPoint(x: -26.0, y: 2.79))
        XCTAssertEqual(minWidthFlange.C1b, CGPoint(x: -26.0, y: 2.79))
    }


    func testC11b() {
        XCTAssertEqual(maxWidthFlange.C11b, CGPoint(x: -17.587, y: 1.487))
        XCTAssertEqual(minWidthFlange.C11b, CGPoint(x: -17.587, y: 1.487))
    }


    func testC12() {
        XCTAssertEqual(maxWidthFlange.C12, CGPoint(x: 19.0, y: -0.547))
        XCTAssertEqual(minWidthFlange.C12, CGPoint(x: 19.0, y: -0.547))
    }


    func testB1b() {
        XCTAssertEqual(maxWidthFlange.B1b, CGPoint(x: 29.0, y: -0.547))
        XCTAssertEqual(minWidthFlange.B1b, CGPoint(x: 29.0, y: -0.547))
    }


    func testA1() {

    }


    func testI() {

    }
}
