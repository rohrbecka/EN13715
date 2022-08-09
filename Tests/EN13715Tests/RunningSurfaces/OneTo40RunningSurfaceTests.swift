//
//  OneTo40Tests.swift
//  
//
//  Created by André Rohrbeck on 04.08.22.
//

import XCTest
@testable import EN13715

final class OneTo40RunningSurfaceTests: XCTestCase {

    let maxWidthFlange = OneTo40RunningSurface(e: 32.5, slopePercent: 15, wheelWidth: 140)
    let minWidthFlange = OneTo40RunningSurface(e: 28.5, slopePercent: 6.7, wheelWidth: 135)

    func testJm() {
        XCTAssertEqual(maxWidthFlange.Jm.x, -14.740, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.Jm.x, -18.740, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.Jm.y, 36.380, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.Jm.y, 36.380, accuracy: 0.0000001)
    }


    func testD1() {
        XCTAssertEqual(maxWidthFlange.D1.x, -35, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D1.x, -39, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.D1.y, 6.867, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D1.y, 6.867, accuracy: 0.0000001)
    }


    func testD1a() {
        XCTAssertEqual(maxWidthFlange.D1a.x, -32.696, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D1a.x, -36.696, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.D1a.y, 5.180, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D1a.y, 5.180, accuracy: 0.0000001)
    }


    func testDm() {
        XCTAssertEqual(maxWidthFlange.Dm.x, -26.211, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.Dm.x, -30.211, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.Dm.y, 16.446, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.Dm.y, 16.446, accuracy: 0.0000001)
    }


    func testC1a() {
        XCTAssertEqual(maxWidthFlange.C1a.x, -26.0, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.C1a.x, -30.0, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.C1a.y, 2.187, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.C1a.y, 2.187, accuracy: 0.0000001)
    }


    func testC11a() {
        XCTAssertEqual(maxWidthFlange.C11a.x, -15.640, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.C11a.x, -19.640, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.C11a.y, 0.391, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.C11a.y, 0.391, accuracy: 0.0000001)
    }


    func testT1() {
        XCTAssertEqual(maxWidthFlange.T1.x, -0.5, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.T1.x, -4.5, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.T1.y, 0.013, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.T1.y, 0.013, accuracy: 0.0000001)
    }


    func testD0() {
        XCTAssertEqual(maxWidthFlange.D0.x, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D0.x, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.D0.y, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.D0.y, 0.0, accuracy: 0.0000001)
    }


    func testB1a() {
        XCTAssertEqual(maxWidthFlange.B1a.x, 35, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.B1a.x, 35, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.B1a.y, -0.875, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.B1a.y, -0.875, accuracy: 0.0000001)
    }


    func testA1() {
        XCTAssertEqual(maxWidthFlange.A1.x, 65, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.A1.x, 60, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.A1.y, -0.875 - 4.5, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.A1.y, -0.875 - 1.675, accuracy: 0.0000001)
    }


    func testI() {
        XCTAssertEqual(maxWidthFlange.I.x, 70, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.I.x, 65, accuracy: 0.0000001)
        XCTAssertEqual(maxWidthFlange.I.y, -0.875 - 4.5 - 5, accuracy: 0.0000001)
        XCTAssertEqual(minWidthFlange.I.y, -0.875 - 1.675 - 5, accuracy: 0.0000001)
    }
}
