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


    func testJm() {
        XCTAssertEqual(OneTo40RunningSurface.Jm(e: 32.5).x, -14.740, accuracy: 0.0000001)
        XCTAssertEqual(OneTo40RunningSurface.Jm(e: 28.5).x, -18.740, accuracy: 0.0000001)
        XCTAssertEqual(OneTo40RunningSurface.Jm(e: 32.5).y, 36.380, accuracy: 0.0000001)
        XCTAssertEqual(OneTo40RunningSurface.Jm(e: 28.5).y, 36.380, accuracy: 0.0000001)
    }


    func testThatMaximumDistanceIsRespected() {
        XCTAssertLessThan(maxWidthFlange.profile(resolution: 1.0).distances.max()!, 1.0000001)
        XCTAssertLessThan(minWidthFlange.profile(resolution: 0.2).distances.max()!, 0.200001)
    }



    func testThatAllCharacteristicPointsArePresent() {
        let sut0 = maxWidthFlange.profile(resolution: 1.0)
        let sut1 = minWidthFlange.profile(resolution: 0.5)

        XCTAssert(sut0.contains(EN13715.D1a(e: 32.5)))
        XCTAssert(sut0.contains(EN13715.C11a(e: 32.5)))
        XCTAssert(sut0.contains(EN13715.T1(e: 32.5)))
        XCTAssert(sut0.contains(EN13715.D0))
        XCTAssert(sut0.contains(EN13715.B1a))
        XCTAssert(sut0.contains(maxWidthFlange.A1))
        XCTAssert(sut0.contains(maxWidthFlange.I))

        XCTAssert(sut1.contains(EN13715.D1a(e: 28.5)))
        XCTAssert(sut1.contains(EN13715.C11a(e: 28.5)))
        XCTAssert(sut1.contains(EN13715.T1(e: 28.5)))
        XCTAssert(sut1.contains(EN13715.D0))
        XCTAssert(sut1.contains(EN13715.B1a))
        XCTAssert(sut1.contains(minWidthFlange.A1))
        XCTAssert(sut1.contains(minWidthFlange.I))
    }
}
