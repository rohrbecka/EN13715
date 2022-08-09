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

    func testD1() {
        XCTAssertEqual(maxWidthFlange.D1.x, -35.0)
        XCTAssertEqual(minWidthFlange.D1.x, -39.0)
        XCTAssertEqual(maxWidthFlange.D1.y, 6.867)
        XCTAssertEqual(minWidthFlange.D1.y, 6.867)
    }


    func testE1() {
        XCTAssertEqual(maxWidthFlange.E1.x, -38.427)
        XCTAssertEqual(minWidthFlange.E1.x, -42.427)
        XCTAssertEqual(maxWidthFlange.E1.y, 12.0)
        XCTAssertEqual(minWidthFlange.E1.y, 12.0)
    }


    func testDm() {
        XCTAssertEqual(maxWidthFlange.Dm.x, -26.211)
        XCTAssertEqual(minWidthFlange.Dm.x, -30.211)
        XCTAssertEqual(maxWidthFlange.Dm.y, 16.446)
        XCTAssertEqual(minWidthFlange.Dm.y, 16.446)
    }


    func testF1() {
        XCTAssertEqual(maxWidthFlange28.F1.x, -39.765)
        XCTAssertEqual(maxWidthFlange30.F1.x, -40.530)
        XCTAssertEqual(maxWidthFlange32.F1.x, -41.497)
        XCTAssertEqual(minWidthFlange28.F1.x, -43.765)
        XCTAssertEqual(minWidthFlange30.F1.x, -44.530)
        XCTAssertEqual(minWidthFlange32.F1.x, -45.497)
        XCTAssertEqual(maxWidthFlange28.F1.y, 15.675)
        XCTAssertEqual(maxWidthFlange30.F1.y, 17.779)
        XCTAssertEqual(maxWidthFlange32.F1.y, 20.434)
        XCTAssertEqual(minWidthFlange28.F1.y, 15.675)
        XCTAssertEqual(minWidthFlange30.F1.y, 17.779)
        XCTAssertEqual(minWidthFlange32.F1.y, 20.434)
    }


    func testG1() {
        XCTAssertEqual(maxWidthFlange28.G1.x, -49.663)
        XCTAssertEqual(maxWidthFlange30.G1.x, -47.758)
        XCTAssertEqual(maxWidthFlange32.G1.x, -46.153)
        XCTAssertEqual(minWidthFlange28.G1.x, -53.663)
        XCTAssertEqual(minWidthFlange30.G1.x, -51.758)
        XCTAssertEqual(minWidthFlange32.G1.x, -50.153)
        XCTAssertEqual(maxWidthFlange28.G1.y, 26.748)
        XCTAssertEqual(maxWidthFlange30.G1.y, 27.568)
        XCTAssertEqual(maxWidthFlange32.G1.y, 28.108)
        XCTAssertEqual(minWidthFlange28.G1.y, 26.748)
        XCTAssertEqual(minWidthFlange30.G1.y, 27.568)
        XCTAssertEqual(minWidthFlange32.G1.y, 28.108)
    }


    func testS() {
        XCTAssertEqual(flangeE32_5H28.S.x, -55)
        XCTAssertEqual(flangeE31_5H28.S.x, -55.5)
        XCTAssertEqual(flangeE30_5H28.S.x, -56)
        XCTAssertEqual(flangeE29_5H28.S.x, -56.5)
        XCTAssertEqual(flangeE28_5H28.S.x, -57)
        XCTAssertEqual(flangeE32_5H30.S.x, -55)
        XCTAssertEqual(flangeE31_5H30.S.x, -55.5)
        XCTAssertEqual(flangeE30_5H30.S.x, -56)
        XCTAssertEqual(flangeE29_5H30.S.x, -56.5)
        XCTAssertEqual(flangeE28_5H30.S.x, -57)
        XCTAssertEqual(flangeE32_5H32.S.x, -55)
        XCTAssertEqual(flangeE31_5H32.S.x, -55.5)
        XCTAssertEqual(flangeE30_5H32.S.x, -56)
        XCTAssertEqual(flangeE29_5H32.S.x, -56.5)
        XCTAssertEqual(flangeE28_5H32.S.x, -57)
        XCTAssertEqual(flangeE32_5H28.S.y, 28.0)
        XCTAssertEqual(flangeE31_5H28.S.y, 27.990)
        XCTAssertEqual(flangeE30_5H28.S.y, 27.958)
        XCTAssertEqual(flangeE29_5H28.S.y, 27.906)
        XCTAssertEqual(flangeE28_5H28.S.y, 27.832)
        XCTAssertEqual(flangeE32_5H30.S.y, 30.0)
        XCTAssertEqual(flangeE31_5H30.S.y, 29.990)
        XCTAssertEqual(flangeE30_5H30.S.y, 29.958)
        XCTAssertEqual(flangeE29_5H30.S.y, 29.906)
        XCTAssertEqual(flangeE28_5H30.S.y, 29.832)
        XCTAssertEqual(flangeE32_5H32.S.y, 32.0)
        XCTAssertEqual(flangeE31_5H32.S.y, 31.990)
        XCTAssertEqual(flangeE30_5H32.S.y, 31.958)
        XCTAssertEqual(flangeE29_5H32.S.y, 31.906)
        XCTAssertEqual(flangeE28_5H32.S.y, 31.832)
    }


    func testH1() {
        XCTAssertEqual(maxWidthFlange28.H1.x, -62.765)
        XCTAssertEqual(maxWidthFlange30.H1.x, -62.765)
        XCTAssertEqual(maxWidthFlange32.H1.x, -62.765)
        XCTAssertEqual(minWidthFlange28.H1.x, -62.765)
        XCTAssertEqual(minWidthFlange30.H1.x, -62.765)
        XCTAssertEqual(minWidthFlange32.H1.x, -62.765)
        XCTAssertEqual(maxWidthFlange28.H1.y, 25.149)
        XCTAssertEqual(maxWidthFlange30.H1.y, 27.149)
        XCTAssertEqual(maxWidthFlange32.H1.y, 29.149)
        XCTAssertEqual(minWidthFlange28.H1.y, 25.149)
        XCTAssertEqual(minWidthFlange30.H1.y, 27.149)
        XCTAssertEqual(minWidthFlange32.H1.y, 29.149)
    }


    func testH2() {
        XCTAssertEqual(maxWidthFlange28.H2.x, -70)
        XCTAssertEqual(maxWidthFlange30.H2.x, -70)
        XCTAssertEqual(maxWidthFlange32.H2.x, -70)
        XCTAssertEqual(minWidthFlange28.H2.x, -70)
        XCTAssertEqual(minWidthFlange30.H2.x, -70)
        XCTAssertEqual(minWidthFlange32.H2.x, -70)
        XCTAssertEqual(maxWidthFlange28.H2.y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(maxWidthFlange30.H2.y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(maxWidthFlange32.H2.y, 13.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange28.H2.y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange30.H2.y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange32.H2.y, 13.519, accuracy: 0.00000001)
    }


    func testHm() {
        XCTAssertEqual(maxWidthFlange28.Hm.x, -49.5)
        XCTAssertEqual(maxWidthFlange30.Hm.x, -49.5)
        XCTAssertEqual(maxWidthFlange32.Hm.x, -49.5)
        XCTAssertEqual(minWidthFlange28.Hm.x, -49.5)
        XCTAssertEqual(minWidthFlange30.Hm.x, -49.5)
        XCTAssertEqual(minWidthFlange32.Hm.x, -49.5)
        XCTAssertEqual(maxWidthFlange28.Hm.y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(maxWidthFlange30.Hm.y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(maxWidthFlange32.Hm.y, 13.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange28.Hm.y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange30.Hm.y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(minWidthFlange32.Hm.y, 13.519, accuracy: 0.00000001)
    }


    func testFm() {
        XCTAssertEqual(maxWidthFlange28.Fm.x, -58.558)
        XCTAssertEqual(maxWidthFlange30.Fm.x, -60.733)
        XCTAssertEqual(maxWidthFlange32.Fm.x, -63.110)
        XCTAssertEqual(minWidthFlange28.Fm.x, -62.558)
        XCTAssertEqual(minWidthFlange30.Fm.x, -64.733)
        XCTAssertEqual(minWidthFlange32.Fm.x, -67.110)
        XCTAssertEqual(maxWidthFlange28.Fm.y, 8.835)
        XCTAssertEqual(maxWidthFlange30.Fm.y, 10.425)
        XCTAssertEqual(maxWidthFlange32.Fm.y, 12.558)
        XCTAssertEqual(minWidthFlange28.Fm.y, 8.835)
        XCTAssertEqual(minWidthFlange30.Fm.y, 10.425)
        XCTAssertEqual(minWidthFlange32.Fm.y, 12.558)
    }


    func testRIm() {
        XCTAssertEqual(maxWidthFlange28.RIm.x, -55.0)
        XCTAssertEqual(maxWidthFlange30.RIm.x, -55.0)
        XCTAssertEqual(maxWidthFlange32.RIm.x, -55.0)
        XCTAssertEqual(minWidthFlange28.RIm.x, -55.0)
        XCTAssertEqual(minWidthFlange30.RIm.x, -55.0)
        XCTAssertEqual(minWidthFlange32.RIm.x, -55.0)
        XCTAssertEqual(maxWidthFlange28.RIm.y, 16.0)
        XCTAssertEqual(maxWidthFlange30.RIm.y, 18.0)
        XCTAssertEqual(maxWidthFlange32.RIm.y, 20.0)
        XCTAssertEqual(minWidthFlange28.RIm.y, 16.0)
        XCTAssertEqual(minWidthFlange30.RIm.y, 18.0)
        XCTAssertEqual(minWidthFlange32.RIm.y, 20.0)
    }


    func testREm() {
        XCTAssertEqual(maxWidthFlange28.REm.x, -55.0)
        XCTAssertEqual(maxWidthFlange30.REm.x, -55.0)
        XCTAssertEqual(maxWidthFlange32.REm.x, -55.0)
        XCTAssertEqual(minWidthFlange28.REm.x, -59.0)
        XCTAssertEqual(minWidthFlange30.REm.x, -59.0)
        XCTAssertEqual(minWidthFlange32.REm.x, -59.0)
        XCTAssertEqual(maxWidthFlange28.REm.y, 16.0)
        XCTAssertEqual(maxWidthFlange30.REm.y, 18.0)
        XCTAssertEqual(maxWidthFlange32.REm.y, 20.0)
        XCTAssertEqual(minWidthFlange28.REm.y, 16.0)
        XCTAssertEqual(minWidthFlange30.REm.y, 18.0)
        XCTAssertEqual(minWidthFlange32.REm.y, 20.0)
    }


    func testRfa() {
        XCTAssertEqual(maxWidthFlange28.Rfa, 20.0)
        XCTAssertEqual(maxWidthFlange30.Rfa, 21.5)
        XCTAssertEqual(maxWidthFlange32.Rfa, 23.0)
        XCTAssertEqual(minWidthFlange28.Rfa, 20.0)
        XCTAssertEqual(minWidthFlange30.Rfa, 21.5)
        XCTAssertEqual(minWidthFlange32.Rfa, 23.0)
    }




}
