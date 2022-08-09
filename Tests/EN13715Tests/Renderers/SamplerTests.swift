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
    func testSimpleArcInQ1() {
        let sut = Sampler.arc(from: CGPoint(x: 1, y: 0),
                              to: CGPoint(x: 0, y: 1),
                              center: CGPoint(x: 0, y: 0),
                              radius: 1,
                              resolution: Double.pi/8.0)

        guard sut.count == 4 else {
            XCTFail("Wrong length of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 0.924, y: 0.383), accuracy: 0.001)
        XCTAssertEqual(sut[1], CGPoint(x: 0.707, y: 0.707), accuracy: 0.001)
        XCTAssertEqual(sut[2], CGPoint(x: 0.383, y: 0.924), accuracy: 0.001)
        XCTAssertEqual(sut[3], CGPoint(x: 0, y: 1), accuracy: 0.0001)
    }



    func testSimpleArcInQ4toQ2() {
        let sut = Sampler.arc(from: CGPoint(x: 1, y: 0),
                              to: CGPoint(x: 0, y: 1),
                              center: CGPoint(x: 0, y: 0),
                              radius: 1,
                              negativeDirection: true,
                              resolution: Double.pi/8.0)

        guard sut.count == 12 else {
            XCTFail("Wrong length of result. Expected 12, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 0.924, y: -0.383), accuracy: 0.001)
        XCTAssertEqual(sut[1], CGPoint(x: 0.707, y: -0.707), accuracy: 0.001)
        XCTAssertEqual(sut[2], CGPoint(x: 0.383, y: -0.924), accuracy: 0.001)
        XCTAssertEqual(sut[3], CGPoint(x: 0, y: -1), accuracy: 0.0001)
        XCTAssertEqual(sut[4], CGPoint(x: -0.383, y: -0.924), accuracy: 0.001)
        XCTAssertEqual(sut[5], CGPoint(x: -0.707, y: -0.707), accuracy: 0.001)
        XCTAssertEqual(sut[6], CGPoint(x: -0.924, y: -0.383), accuracy: 0.001)
        XCTAssertEqual(sut[7], CGPoint(x: -1, y: 0), accuracy: 0.0001)
        XCTAssertEqual(sut[8], CGPoint(x: -0.924, y: 0.383), accuracy: 0.001)
        XCTAssertEqual(sut[9], CGPoint(x: -0.707, y: 0.707), accuracy: 0.001)
        XCTAssertEqual(sut[10], CGPoint(x: -0.383, y: 0.924), accuracy: 0.001)
        XCTAssertEqual(sut[11], CGPoint(x: 0, y: 1), accuracy: 0.0001)
    }



    func testSimpleArcWithCenterNotAtZero() {
        let sut = Sampler.arc(from: CGPoint(x: 4, y: 1),
                              to: CGPoint(x: 2, y: 3),
                              center: CGPoint(x: 2, y: 1),
                              radius: 2,
                              resolution: Double.pi/4.0)

        guard sut.count == 4 else {
            XCTFail("Wrong length of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 2 + 2 * 0.924, y: 1 + 2 * 0.383), accuracy: 0.001)
        XCTAssertEqual(sut[1], CGPoint(x: 2 + 2 * 0.707, y: 1 + 2 * 0.707), accuracy: 0.001)
        XCTAssertEqual(sut[2], CGPoint(x: 2 + 2 * 0.383, y: 1 + 2 * 0.924), accuracy: 0.001)
        XCTAssertEqual(sut[3], CGPoint(x: 2 + 2 * 0, y: 1 + 2 * 1), accuracy: 0.0001)
    }

    // MARK: - resample()

    func testResamplingOfASinglePointReturnsAnEmptyArray() {
        let source = [CGPoint(x: 3.0, y: 6.0)]
        XCTAssertEqual(Sampler.resample(source, resolution: 1.0), [CGPoint]())
        XCTAssertEqual(Sampler.resample(source, resolution: 0.1), [CGPoint]())
        XCTAssertEqual(Sampler.resample(source, resolution: 100.1), [CGPoint]())
    }



    func testResamplingWithTwoPointsButTooLowResolutionReturnsOnlySecondPoint() {
        let source = [CGPoint(x: 1.0, y: 2.0),
                      CGPoint(x: 2.0, y: 3.0)]
        let resultLowResolution = Sampler.resample(source, resolution: 1.42)
        XCTAssertEqual(resultLowResolution, [source[1]])
    }



    func testResamplingWithTwoPointsHighResolution() {
        let source = [CGPoint(x: 1.0, y: 2.0),
                      CGPoint(x: 2.0, y: 3.0)]
        let sut = Sampler.resample(source, resolution: 0.5)
        guard sut.count == 3 else {
            XCTFail("Wrong lenght of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 1.2929, y: 2.2929), accuracy: 0.0001)
        XCTAssertEqual(sut[1], CGPoint(x: 1.6464, y: 2.6464), accuracy: 0.0001)
        XCTAssertEqual(sut[2], CGPoint(x: 2.0, y: 3.0), accuracy: 0.0001)
    }


    func testResamplingWithThreePointsHighResolution() {
        let source = [CGPoint(x: 1.0, y: 2.0),
                      CGPoint(x: 2.0, y: 3.0),
                      CGPoint(x: 3.0, y: 2.0)]
        let sut = Sampler.resample(source, resolution: 0.5)
        guard sut.count == 6 else {
            XCTFail("Wrong lenght of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 1.2929, y: 2.2929), accuracy: 0.0001)
        XCTAssertEqual(sut[1], CGPoint(x: 1.6464, y: 2.6464), accuracy: 0.0001)
        XCTAssertEqual(sut[2], CGPoint(x: 2.0, y: 3.0), accuracy: 0.0001)
        XCTAssertEqual(sut[3], CGPoint(x: 2.2929, y: 2.7071), accuracy: 0.0001)
        XCTAssertEqual(sut[4], CGPoint(x: 2.6464, y: 2.3536), accuracy: 0.0001)
        XCTAssertEqual(sut[5], CGPoint(x: 3.0, y: 2.0), accuracy: 0.0001)
    }



    func testResamplingWithTwoPointsLowResolution() {
        let source = [CGPoint(x: 1.0, y: 2.0),
                      CGPoint(x: 2.0, y: 3.0)]
        let sut = Sampler.resample(source, resolution: 1.42)
        guard sut.count == 1 else {
            XCTFail("Wrong lenght of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 2.0, y: 3.0), accuracy: 0.0001)
    }



    func testResamplingWithThreePointsLowResolution() {
        let source = [CGPoint(x: 1.0, y: 2.0),
                      CGPoint(x: 2.0, y: 3.0),
                      CGPoint(x: 3.0, y: 2.0)]
        let sut = Sampler.resample(source, resolution: 1.42)
        guard sut.count == 2 else {
            XCTFail("Wrong lenght of result. Expected 4, got \(sut.count)."); return
        }
        XCTAssertEqual(sut[0], CGPoint(x: 2.0, y: 3.0), accuracy: 0.0001)
        XCTAssertEqual(sut[1], CGPoint(x: 3.0, y: 2.0), accuracy: 0.0001)
    }
}



func XCTAssertEqual(_ lhs: CGPoint, _ rhs: CGPoint, accuracy: Double, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(lhs.x, rhs.x, accuracy: accuracy, file: file, line: line)
    XCTAssertEqual(lhs.y, rhs.y, accuracy: accuracy, file: file, line: line)
}
