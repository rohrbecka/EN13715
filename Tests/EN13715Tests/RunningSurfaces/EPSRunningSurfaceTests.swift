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
        XCTAssertEqual(EPSRunningSurface.Jm, CGPoint(x: -6.5, y: 100.871))
    }


    func testJm1() {
        XCTAssertEqual(EPSRunningSurface.Jm1, CGPoint(x: 19.0, y: 329.453))
    }


    func testC1b() {
        XCTAssertEqual(EPSRunningSurface.C1b, CGPoint(x: -26.0, y: 2.79))
    }


    func testC11b() {
        XCTAssertEqual(EPSRunningSurface.C11b, CGPoint(x: -17.587, y: 1.487))
    }


    func testC12() {
        XCTAssertEqual(EPSRunningSurface.C12, CGPoint(x: 19.0, y: -0.547))
    }


    func testB1b() {
        XCTAssertEqual(EPSRunningSurface.B1b, CGPoint(x: 29.0, y: -0.547))
    }


    func testA1() {
        XCTAssertEqual(maxWidthFlange.A1.x, 65)
        XCTAssertEqual(maxWidthFlange.A1.y, -5.947, accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.A1, CGPoint(x: 60, y: -2.624))
    }


    func testI() {
        XCTAssertEqual(maxWidthFlange.I.x, 70)
        XCTAssertEqual(maxWidthFlange.I.y, -10.947, accuracy: 0.000001)
        XCTAssertEqual(minWidthFlange.I.x, 65)
        XCTAssertEqual(minWidthFlange.I.y, -7.624, accuracy: 0.000001)
    }


    func testThatMaximumDistanceIsRespected() {
        XCTAssertLessThan(maxWidthFlange.profile(resolution: 1.0).distances.max()!, 1.0000001)
        XCTAssertLessThan(minWidthFlange.profile(resolution: 0.2).distances.max()!, 0.200002)
    }



    func testThatAllCharacteristicPointsArePresent() {
        let sut0 = maxWidthFlange.profile(resolution: 1.0)
        let sut1 = minWidthFlange.profile(resolution: 0.5)

        XCTAssert(sut0.contains(EPSRunningSurface.C1b))
        XCTAssert(sut0.contains(EPSRunningSurface.C11b))
        XCTAssert(sut0.contains(EPSRunningSurface.C12))
        XCTAssert(sut0.contains(EPSRunningSurface.B1b))
        XCTAssert(sut0.contains(maxWidthFlange.A1))
        XCTAssert(sut0.contains(maxWidthFlange.I))

        XCTAssert(sut1.contains(EPSRunningSurface.C1b))
        XCTAssert(sut1.contains(EPSRunningSurface.C11b))
        XCTAssert(sut1.contains(EPSRunningSurface.C12))
        XCTAssert(sut1.contains(EPSRunningSurface.B1b))
        XCTAssert(sut1.contains(minWidthFlange.A1))
        XCTAssert(sut1.contains(minWidthFlange.I))
    }
}
