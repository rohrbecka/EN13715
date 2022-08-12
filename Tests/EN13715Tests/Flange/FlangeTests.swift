//
//  FlangeTests.swift
//  
//
//  Created by André Rohrbeck on 03.08.22.
//

import XCTest
@testable import EN13715

final class FlangeTests: XCTestCase {

    let maxWidthFlange = Flange(e: 32.5, h: 28.0)
    let minWidthFlange = Flange(e: 28.5, h: 28.0)
    let maxWidthFlange28 = Flange(e: 32.5, h: 28.0)
    let minWidthFlange28 = Flange(e: 28.5, h: 28.0)
    let maxWidthFlange30 = Flange(e: 32.5, h: 30.0)
    let minWidthFlange30 = Flange(e: 28.5, h: 30.0)
    let maxWidthFlange32 = Flange(e: 32.5, h: 32.0)
    let minWidthFlange32 = Flange(e: 28.5, h: 32.0)
    let flangeE32_5H28 = Flange(e: 32.5, h: 28.0)
    let flangeE31_5H28 = Flange(e: 31.5, h: 28.0)
    let flangeE30_5H28 = Flange(e: 30.5, h: 28.0)
    let flangeE29_5H28 = Flange(e: 29.5, h: 28.0)
    let flangeE28_5H28 = Flange(e: 28.5, h: 28.0)
    let flangeE32_5H30 = Flange(e: 32.5, h: 30.0)
    let flangeE31_5H30 = Flange(e: 31.5, h: 30.0)
    let flangeE30_5H30 = Flange(e: 30.5, h: 30.0)
    let flangeE29_5H30 = Flange(e: 29.5, h: 30.0)
    let flangeE28_5H30 = Flange(e: 28.5, h: 30.0)
    let flangeE32_5H32 = Flange(e: 32.5, h: 32.0)
    let flangeE31_5H32 = Flange(e: 31.5, h: 32.0)
    let flangeE30_5H32 = Flange(e: 30.5, h: 32.0)
    let flangeE29_5H32 = Flange(e: 29.5, h: 32.0)
    let flangeE28_5H32 = Flange(e: 28.5, h: 32.0)



// MARK: Profile shape
    func testProfileHeight() {
        XCTAssertEqual(maxWidthFlange.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(minWidthFlange.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(maxWidthFlange28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(minWidthFlange28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(maxWidthFlange30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(minWidthFlange30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(maxWidthFlange32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(minWidthFlange32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(flangeE32_5H28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(flangeE31_5H28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(flangeE30_5H28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(flangeE29_5H28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(flangeE28_5H28.profile(resolution: 0.5).map{$0.y}.max()!, 28.0, accuracy: 0.2)
        XCTAssertEqual(flangeE32_5H30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(flangeE31_5H30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(flangeE30_5H30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(flangeE29_5H30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(flangeE28_5H30.profile(resolution: 0.5).map{$0.y}.max()!, 30.0, accuracy: 0.2)
        XCTAssertEqual(flangeE32_5H32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(flangeE31_5H32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(flangeE30_5H32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(flangeE29_5H32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
        XCTAssertEqual(flangeE28_5H32.profile(resolution: 0.5).map{$0.y}.max()!, 32.0, accuracy: 0.2)
    }



    func testFlangeWidth() {
        XCTAssertEqual(maxWidthFlange.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(minWidthFlange.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(maxWidthFlange28.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(minWidthFlange28.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(maxWidthFlange30.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(minWidthFlange30.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(maxWidthFlange32.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(minWidthFlange32.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(flangeE32_5H28.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(flangeE31_5H28.profile(resolution: 0.1).flangeWidth, 31.5, accuracy: 0.1)
        XCTAssertEqual(flangeE30_5H28.profile(resolution: 0.1).flangeWidth, 30.5, accuracy: 0.1)
        XCTAssertEqual(flangeE29_5H28.profile(resolution: 0.1).flangeWidth, 29.5, accuracy: 0.1)
        XCTAssertEqual(flangeE28_5H28.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(flangeE32_5H30.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(flangeE31_5H30.profile(resolution: 0.1).flangeWidth, 31.5, accuracy: 0.1)
        XCTAssertEqual(flangeE30_5H30.profile(resolution: 0.1).flangeWidth, 30.5, accuracy: 0.1)
        XCTAssertEqual(flangeE29_5H30.profile(resolution: 0.1).flangeWidth, 29.5, accuracy: 0.1)
        XCTAssertEqual(flangeE28_5H30.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
        XCTAssertEqual(flangeE32_5H32.profile(resolution: 0.1).flangeWidth, 32.5, accuracy: 0.1)
        XCTAssertEqual(flangeE31_5H32.profile(resolution: 0.1).flangeWidth, 31.5, accuracy: 0.1)
        XCTAssertEqual(flangeE30_5H32.profile(resolution: 0.1).flangeWidth, 30.5, accuracy: 0.1)
        XCTAssertEqual(flangeE29_5H32.profile(resolution: 0.1).flangeWidth, 29.5, accuracy: 0.1)
        XCTAssertEqual(flangeE28_5H32.profile(resolution: 0.1).flangeWidth, 28.5, accuracy: 0.1)
    }



    func testThatMaximumDistanceIsRespected() {
        XCTAssertLessThan(maxWidthFlange.profile(resolution: 1.0).distances.max()!, 1.0000001)
        XCTAssertLessThan(minWidthFlange.profile(resolution: 0.2).distances.max()!, 0.200001)
    }


    func testThatAllCharacteristicPointsArePresent() {
        let sut0 = maxWidthFlange.profile(resolution: 1.0)
        let sut1 = minWidthFlange.profile(resolution: 0.5)

        XCTAssert(sut0.contains(EN13715.D1(e: maxWidthFlange.e)))
        XCTAssert(sut0.contains(EN13715.E1(e: maxWidthFlange.e)))
        XCTAssert(sut0.contains(EN13715.F1(h: maxWidthFlange.h, e: maxWidthFlange.e)))
        XCTAssert(sut0.contains(EN13715.G1(h: maxWidthFlange.h, e: maxWidthFlange.e)))
        XCTAssert(sut0.contains(EN13715.H1(h: maxWidthFlange.h)))
        XCTAssert(sut0.contains(EN13715.H2(h: maxWidthFlange.h)))
        XCTAssert(sut0.contains(EN13715.S(h: maxWidthFlange.h, e: maxWidthFlange.e)))

        XCTAssert(sut1.contains(EN13715.D1(e: minWidthFlange.e)))
        XCTAssert(sut1.contains(EN13715.E1(e: minWidthFlange.e)))
        XCTAssert(sut1.contains(EN13715.F1(h: minWidthFlange.h, e: minWidthFlange.e)))
        XCTAssert(sut1.contains(EN13715.G1(h: minWidthFlange.h, e: minWidthFlange.e)))
        XCTAssert(sut1.contains(EN13715.H1(h: minWidthFlange.h)))
        XCTAssert(sut1.contains(EN13715.H2(h: minWidthFlange.h)))
        XCTAssert(sut1.contains(EN13715.S(h: minWidthFlange.h, e: minWidthFlange.e)))
    }
}



// MARK: private methods
extension Array where Element == CGPoint {
    /// Returns the width of the flange measured at 10 mm above wheel top.
    var flangeWidth: Double {
        guard let innerPoint = self.first(where: {$0.y > 10.0}),
                let outerPoint = self.last(where: {$0.y > 10.0}) else {
            return 0.0
        }
        return outerPoint.x - innerPoint.x
    }


    var distances: [Double] {
        self.dropLast().enumerated().map {index, point in
            let secondPoint = self[index+1]
            return Array<CGPoint>.distance(from: point, to: secondPoint)
        }
    }


    /// Calculates the distance betweem two ``CGPoint``s assuming a cartesian co-ordinate system.
    ///
    /// - Parameter p0: The first point.
    /// - Parameter p1: The second point.
    /// - Returns The distance.
    private static func distance(from p0: CGPoint, to p1: CGPoint) -> Double {
        let xDist = p1.x - p0.x
        let yDist = p1.y - p0.y
        return sqrt(yDist*yDist + xDist*xDist)
    }
}
