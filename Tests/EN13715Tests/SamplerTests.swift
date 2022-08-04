//
//  SamplerTests.swift
//  
//
//  Created by André Rohrbeck on 04.08.22.
//

import XCTest
@testable import EN13715

final class SamplerTests: XCTestCase {


// MARK: - straighLine()
    func testStraightLine_havingTwoHorizontallyAlignedPoints() throws {

        let sut = Sampler.straightLine(from: CGPoint(x: 20.0, y: 30.0),
                                       to: CGPoint(x: 39.0, y: 30.0),
                                       resolution: 2.0)

        guard sut.count == 10 else {
            XCTFail("Wrong length of result."); return        }
        XCTAssertEqual(sut[0], CGPoint(x: 21.0, y: 30.0))
        XCTAssertEqual(sut[1], CGPoint(x: 23.0, y: 30.0))
        XCTAssertEqual(sut[2], CGPoint(x: 25.0, y: 30.0))
        XCTAssertEqual(sut[3], CGPoint(x: 27.0, y: 30.0))
        XCTAssertEqual(sut[4], CGPoint(x: 29.0, y: 30.0))
        XCTAssertEqual(sut[5], CGPoint(x: 31.0, y: 30.0))
        XCTAssertEqual(sut[6], CGPoint(x: 33.0, y: 30.0))
        XCTAssertEqual(sut[7], CGPoint(x: 35.0, y: 30.0))
        XCTAssertEqual(sut[8], CGPoint(x: 37.0, y: 30.0))
        XCTAssertEqual(sut[9], CGPoint(x: 39.0, y: 30.0))
    }



    func testStraightLine_havingTwoHorizontallyAlignedPointsWithIdealDistance() throws {

        let sut = Sampler.straightLine(from: CGPoint(x: 20.0, y: 30.0),
                                       to: CGPoint(x: 30.0, y: 30.0),
                                       resolution: 2.0)

        guard sut.count == 5 else {
            XCTFail("Wrong length of result."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 22.0, y: 30.0))
        XCTAssertEqual(sut[1], CGPoint(x: 24.0, y: 30.0))
        XCTAssertEqual(sut[2], CGPoint(x: 26.0, y: 30.0))
        XCTAssertEqual(sut[3], CGPoint(x: 28.0, y: 30.0))
        XCTAssertEqual(sut[4], CGPoint(x: 30.0, y: 30.0))
    }



    func testStraighLine_havingTwoVerticallAlignedPoints() throws {
        let sut = Sampler.straightLine(from: CGPoint(x: -10.0, y: 6.0),
                                       to: CGPoint(x: -10.0, y: -5.0),
                                       resolution: 2.0)

        guard sut.count == 6 else {
            XCTAssertEqual(sut.count, 6); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: -10.0, y: 5.0))
        XCTAssertEqual(sut[1], CGPoint(x: -10.0, y: 3.0))
        XCTAssertEqual(sut[2], CGPoint(x: -10.0, y: 1.0))
        XCTAssertEqual(sut[3], CGPoint(x: -10.0, y: -1.0))
        XCTAssertEqual(sut[4], CGPoint(x: -10.0, y: -3.0))
        XCTAssertEqual(sut[5], CGPoint(x: -10.0, y: -5.0))
    }


    func testStraighLine_havingTwoVerticallAlignedPointsWithIdealDistance() throws {
        let sut = Sampler.straightLine(from: CGPoint(x: -10.0, y: 5.0),
                                       to: CGPoint(x: -10.0, y: -5.0),
                                       resolution: 2.0)

        guard sut.count == 5 else {
            XCTAssertEqual(sut.count, 6); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: -10.0, y: 3.0))
        XCTAssertEqual(sut[1], CGPoint(x: -10.0, y: 1.0))
        XCTAssertEqual(sut[2], CGPoint(x: -10.0, y: -1.0))
        XCTAssertEqual(sut[3], CGPoint(x: -10.0, y: -3.0))
        XCTAssertEqual(sut[4], CGPoint(x: -10.0, y: -5.0))
    }


    func testSraightLineWith45DegAngle() {
        let sut = Sampler.straightLine(from: CGPoint(x: 10, y: -10),
                                       to: CGPoint(x: -10, y: 10),
                                       resolution: 2 * sqrt(2))
        guard sut.count == 10 else {
            XCTFail("Wrong length of result."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 8.0, y: -8.0))
        XCTAssertEqual(sut[1], CGPoint(x: 6.0, y: -6.0))
        XCTAssertEqual(sut[2], CGPoint(x: 4.0, y: -4.0))
        XCTAssertEqual(sut[3], CGPoint(x: 2.0, y: -2.0))
        XCTAssertEqual(sut[4], CGPoint(x: 0.0, y: 0.0))
        XCTAssertEqual(sut[5], CGPoint(x: -2.0, y: 2.0))
        XCTAssertEqual(sut[6], CGPoint(x: -4.0, y: 4.0))
        XCTAssertEqual(sut[7], CGPoint(x: -6.0, y: 6.0))
        XCTAssertEqual(sut[8], CGPoint(x: -8.0, y: 8.0))
        XCTAssertEqual(sut[9], CGPoint(x: -10.0, y: 10.0))
    }



    func testSraightLineWith45DegAngleShortened() {
        let sut = Sampler.straightLine(from: CGPoint(x: 9, y: -9),
                                       to: CGPoint(x: -10, y: 10),
                                       resolution: 2 * sqrt(2))
        guard sut.count == 10 else {
            XCTFail("Wrong length of result."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 8.0, y: -8.0))
        XCTAssertEqual(sut[1], CGPoint(x: 6.0, y: -6.0))
        XCTAssertEqual(sut[2], CGPoint(x: 4.0, y: -4.0))
        XCTAssertEqual(sut[3], CGPoint(x: 2.0, y: -2.0))
        XCTAssertEqual(sut[4], CGPoint(x: 0.0, y: 0.0))
        XCTAssertEqual(sut[5], CGPoint(x: -2.0, y: 2.0))
        XCTAssertEqual(sut[6], CGPoint(x: -4.0, y: 4.0))
        XCTAssertEqual(sut[7], CGPoint(x: -6.0, y: 6.0))
        XCTAssertEqual(sut[8], CGPoint(x: -8.0, y: 8.0))
        XCTAssertEqual(sut[9], CGPoint(x: -10.0, y: 10.0))
    }


// MARK: - arc()
    
}
