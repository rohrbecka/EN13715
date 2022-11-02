//
//  S1002Tests.swift
//  
//
//  Created by André Rohrbeck on 05.08.22.
//

import XCTest
@testable import EN13715

final class S1002Tests: XCTestCase {

    let maxWidthFlange = S1002RunningSurface(e: 32.5, slopePercent: 15, wheelWidth: 140)
    let S1002_e31_4 = S1002RunningSurface(e: 31.4, slopePercent: 10.0, wheelWidth: 135)
    let minWidthFlange = S1002RunningSurface(e: 28.5, slopePercent: 6.7, wheelWidth: 135)


    func testD1T1() {
        XCTAssertEqual(maxWidthFlange.D1T1[0], CGPoint(x: -34.5, y: 6.432))
        XCTAssertEqual(S1002_e31_4.D1T1[0], CGPoint(x: -35.6, y: 6.432))
        XCTAssertEqual(minWidthFlange.D1T1[0], CGPoint(x: -38.5, y: 6.432))

        // C1
        XCTAssertEqual(maxWidthFlange.D1T1[17], CGPoint(x: -26.0, y: 2.741))
        XCTAssertEqual(S1002_e31_4.D1T1[17], CGPoint(x: -27.1, y: 2.741))
        XCTAssertEqual(minWidthFlange.D1T1[17], CGPoint(x: -30.0, y: 2.741))

        // T1
        XCTAssertEqual(maxWidthFlange.D1T1[68], CGPoint(x: -0.5, y: 0.017))
        XCTAssertEqual(S1002_e31_4.D1T1[68], CGPoint(x: -1.6, y: 0.017), accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.D1T1[68], CGPoint(x: -4.5, y: 0.017))
    }


    func testD0B1() {
        XCTAssertEqual(maxWidthFlange.D0B1[0], CGPoint(x: 0.5, y: -0.016))
        XCTAssertEqual(S1002_e31_4.D0B1[0], CGPoint(x: 0.5, y: -0.016))
        XCTAssertEqual(minWidthFlange.D0B1[0], CGPoint(x: 0.5, y: -0.016))
        XCTAssertEqual(maxWidthFlange.D0B1.last, CGPoint(x: 32.158, y: -0.780))
        XCTAssertEqual(S1002_e31_4.D0B1.last, CGPoint(x: 32.158, y: -0.780))
        XCTAssertEqual(minWidthFlange.D0B1.last, CGPoint(x: 32.158, y: -0.780))
    }


    func testT1() {
        XCTAssertEqual(maxWidthFlange.T1, CGPoint(x: -0.5, y: 0.017))
        XCTAssertEqual(S1002_e31_4.T1, CGPoint(x: -1.6, y: 0.017), accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.T1, CGPoint(x: -4.5, y: 0.017))
    }


    func testA1() {
        XCTAssertEqual(maxWidthFlange.A1, CGPoint(x: 65, y: -5.7063))
        XCTAssertEqual(S1002_e31_4.A1, CGPoint(x: 60, y: -3.5642), accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.A1, CGPoint(x: 60, y: -2.645414))
    }


    func testI() {
        XCTAssertEqual(maxWidthFlange.I, CGPoint(x: 70, y: -10.7063), accuracy: 0.000001)
        XCTAssertEqual(S1002_e31_4.I, CGPoint(x: 65, y: -8.5642), accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.I, CGPoint(x: 65, y: -7.645414), accuracy: 0.000001)
    }
}
