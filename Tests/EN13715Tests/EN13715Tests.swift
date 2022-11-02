import XCTest
@testable import EN13715

final class EN13715Tests: XCTestCase {
    func testProfileDescription() {
        let oneTo40 = try? EN13715.profile(.oneTo40, h: 28, e: 30.5, 15)
        XCTAssertEqual(oneTo40?.description, "EN 13715 — 1/40 / h28 / e30,5 / 15 %")

        let s1002 = try? EN13715.profile(.s1002, h: 30, e: 30, 15)
        XCTAssertEqual(s1002?.description, "EN 13715 — S1002 / h30 / e30 / 15 %")

        let eps = try? EN13715.profile(.eps, h: 32, e: 28.5, 10)
        XCTAssertEqual(eps?.description, "EN 13715 — EPS / h32 / e28,5 / 10 %")
    }



    func testTooSmallHValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 27.9, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 27.9, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 27.9, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
    }



    func testTooHighHValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 32.1, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 32.1, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 32.1, e: 30.5, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .h)
        }
    }



    func testTooSmallEValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 30.0, e: 28.4, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 30.0, e: 28.4, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 30.0, e: 28.4, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
    }



    func testTooHighEValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 30, e: 32.55, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 30, e: 32.55, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 30, e: 32.55, 10)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .e)
        }
    }



    func testTooSmallSlopeValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 30.0, e: 32, 6.6)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 30.0, e: 32, 6.6)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 30.0, e: 32, 6.6)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
    }



    func testTooHighSlopeValues() {
        XCTAssertThrowsError(try EN13715.profile(.oneTo40, h: 30, e: 32, 15.1)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
        XCTAssertThrowsError(try EN13715.profile(.s1002, h: 30, e: 32, 15.1)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
        XCTAssertThrowsError(try EN13715.profile(.eps, h: 30, e: 32, 15.1)) { error in
            XCTAssertEqual(error as? InvalidRangeError, .slope)
        }
    }
}



extension EN13715Tests {
    func testB1a() {
        XCTAssertEqual(EN13715.B1a.x, 35, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.B1a.y, -0.875, accuracy: 0.0000001)
    }


    func testC1a() {
        XCTAssertEqual(EN13715.C1a(e: 32.5).x, -26.0, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C1a(e: 28.5).x, -30.0, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C1a(e: 32.5).y, 2.187, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C1a(e: 28.5).y, 2.187, accuracy: 0.0000001)
    }


    func testC11a() {
        XCTAssertEqual(EN13715.C11a(e: 32.5).x, -15.640, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C11a(e: 28.5).x, -19.640, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C11a(e: 32.5).y, 0.391, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.C11a(e: 28.5).y, 0.391, accuracy: 0.0000001)
    }


    func testD0() {
        XCTAssertEqual(EN13715.D0.x, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D0.x, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D0.y, 0.0, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D0.y, 0.0, accuracy: 0.0000001)
    }


    func testD1() {
        XCTAssertEqual(EN13715.D1(e: 32.5).x, -35.0)
        XCTAssertEqual(EN13715.D1(e: 28.5).x, -39.0)
        XCTAssertEqual(EN13715.D1(e: 32.5).y, 6.867)
        XCTAssertEqual(EN13715.D1(e: 28.5).y, 6.867)
    }


    func testD1a() {
        XCTAssertEqual(EN13715.D1a(e: 32.5).x, -32.696, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D1a(e: 28.5).x, -36.696, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D1a(e: 32.5).y, 5.180, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.D1a(e: 28.5).y, 5.180, accuracy: 0.0000001)
    }


    func testDm() {
        XCTAssertEqual(EN13715.Dm(e: 32.5).x, -26.211)
        XCTAssertEqual(EN13715.Dm(e: 28.5).x, -30.211)
        XCTAssertEqual(EN13715.Dm(e: 32.5).y, 16.446)
        XCTAssertEqual(EN13715.Dm(e: 28.5).y, 16.446)
    }


    func testE1() {
        XCTAssertEqual(EN13715.E1(e: 32.5).x, -38.427)
        XCTAssertEqual(EN13715.E1(e: 28.5).x, -42.427)
        XCTAssertEqual(EN13715.E1(e: 32.5).y, 12.0)
        XCTAssertEqual(EN13715.E1(e: 28.5).y, 12.0)
    }


    func testF1() {
        XCTAssertEqual(EN13715.F1(h: 28, e: 32.5).x, -39.765)
        XCTAssertEqual(EN13715.F1(h: 30, e: 32.5).x, -40.530)
        XCTAssertEqual(EN13715.F1(h: 32, e: 32.5).x, -41.497)
        XCTAssertEqual(EN13715.F1(h: 28, e: 28.5).x, -43.765)
        XCTAssertEqual(EN13715.F1(h: 30, e: 28.5).x, -44.530)
        XCTAssertEqual(EN13715.F1(h: 32, e: 28.5).x, -45.497)
        XCTAssertEqual(EN13715.F1(h: 28, e: 32.5).y, 15.675)
        XCTAssertEqual(EN13715.F1(h: 30, e: 32.5).y, 17.779)
        XCTAssertEqual(EN13715.F1(h: 32, e: 32.5).y, 20.434)
        XCTAssertEqual(EN13715.F1(h: 28, e: 28.5).y, 15.675)
        XCTAssertEqual(EN13715.F1(h: 30, e: 28.5).y, 17.779)
        XCTAssertEqual(EN13715.F1(h: 32, e: 28.5).y, 20.434)
    }


    func testFm() {
        XCTAssertEqual(EN13715.Fm(h: 28, e: 32.5).x, -58.558)
        XCTAssertEqual(EN13715.Fm(h: 30, e: 32.5).x, -60.733)
        XCTAssertEqual(EN13715.Fm(h: 32, e: 32.5).x, -63.110)
        XCTAssertEqual(EN13715.Fm(h: 28, e: 28.5).x, -62.558)
        XCTAssertEqual(EN13715.Fm(h: 30, e: 28.5).x, -64.733)
        XCTAssertEqual(EN13715.Fm(h: 32, e: 28.5).x, -67.110)
        XCTAssertEqual(EN13715.Fm(h: 28, e: 32.5).y, 8.835)
        XCTAssertEqual(EN13715.Fm(h: 30, e: 32.5).y, 10.425)
        XCTAssertEqual(EN13715.Fm(h: 32, e: 32.5).y, 12.558)
        XCTAssertEqual(EN13715.Fm(h: 28, e: 28.5).y, 8.835)
        XCTAssertEqual(EN13715.Fm(h: 30, e: 28.5).y, 10.425)
        XCTAssertEqual(EN13715.Fm(h: 32, e: 28.5).y, 12.558)
    }


    func testG1() {
        XCTAssertEqual(EN13715.G1(h: 28, e: 32.5).x, -49.663)
        XCTAssertEqual(EN13715.G1(h: 30, e: 32.5).x, -47.758)
        XCTAssertEqual(EN13715.G1(h: 32, e: 32.5).x, -46.153)
        XCTAssertEqual(EN13715.G1(h: 28, e: 28.5).x, -53.663)
        XCTAssertEqual(EN13715.G1(h: 30, e: 28.5).x, -51.758)
        XCTAssertEqual(EN13715.G1(h: 32, e: 28.5).x, -50.153)
        XCTAssertEqual(EN13715.G1(h: 28, e: 32.5).y, 26.748)
        XCTAssertEqual(EN13715.G1(h: 30, e: 32.5).y, 27.568)
        XCTAssertEqual(EN13715.G1(h: 32, e: 32.5).y, 28.108)
        XCTAssertEqual(EN13715.G1(h: 28, e: 28.5).y, 26.748)
        XCTAssertEqual(EN13715.G1(h: 30, e: 28.5).y, 27.568)
        XCTAssertEqual(EN13715.G1(h: 32, e: 28.5).y, 28.108)
    }


    func testH1() {
        XCTAssertEqual(EN13715.H1(h: 28).x, -62.765)
        XCTAssertEqual(EN13715.H1(h: 30).x, -62.765)
        XCTAssertEqual(EN13715.H1(h: 32).x, -62.765)
        XCTAssertEqual(EN13715.H1(h: 28).y, 25.149)
        XCTAssertEqual(EN13715.H1(h: 30).y, 27.149)
        XCTAssertEqual(EN13715.H1(h: 32).y, 29.149)
    }


    func testH2() {
        XCTAssertEqual(EN13715.H2(h: 28).x, -70)
        XCTAssertEqual(EN13715.H2(h: 30).x, -70)
        XCTAssertEqual(EN13715.H2(h: 32).x, -70)
        XCTAssertEqual(EN13715.H2(h: 28).y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(EN13715.H2(h: 30).y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(EN13715.H2(h: 32).y, 13.519, accuracy: 0.00000001)
    }


    func testHm() {
        XCTAssertEqual(EN13715.Hm(h: 28).x, -49.5)
        XCTAssertEqual(EN13715.Hm(h: 30).x, -49.5)
        XCTAssertEqual(EN13715.Hm(h: 32).x, -49.5)
        XCTAssertEqual(EN13715.Hm(h: 28).y, 9.519, accuracy: 0.00000001)
        XCTAssertEqual(EN13715.Hm(h: 30).y, 11.519, accuracy: 0.00000001)
        XCTAssertEqual(EN13715.Hm(h: 32).y, 13.519, accuracy: 0.00000001)
    }


    func testRIm() {
        XCTAssertEqual(EN13715.RIm(h: 28).x, -55.0)
        XCTAssertEqual(EN13715.RIm(h: 30).x, -55.0)
        XCTAssertEqual(EN13715.RIm(h: 32).x, -55.0)
        XCTAssertEqual(EN13715.RIm(h: 28).y, 16.0)
        XCTAssertEqual(EN13715.RIm(h: 30).y, 18.0)
        XCTAssertEqual(EN13715.RIm(h: 32).y, 20.0)
        XCTAssertEqual(EN13715.RIm(h: 28).y, 16.0)
        XCTAssertEqual(EN13715.RIm(h: 30).y, 18.0)
        XCTAssertEqual(EN13715.RIm(h: 32).y, 20.0)
    }


    func testREm() {
        XCTAssertEqual(EN13715.REm(h: 28, e: 32.5).x, -55.0)
        XCTAssertEqual(EN13715.REm(h: 30, e: 32.5).x, -55.0)
        XCTAssertEqual(EN13715.REm(h: 32, e: 32.5).x, -55.0)
        XCTAssertEqual(EN13715.REm(h: 28, e: 28.5).x, -59.0)
        XCTAssertEqual(EN13715.REm(h: 30, e: 28.5).x, -59.0)
        XCTAssertEqual(EN13715.REm(h: 32, e: 28.5).x, -59.0)
        XCTAssertEqual(EN13715.REm(h: 28, e: 32.5).y, 16.0)
        XCTAssertEqual(EN13715.REm(h: 30, e: 32.5).y, 18.0)
        XCTAssertEqual(EN13715.REm(h: 32, e: 32.5).y, 20.0)
        XCTAssertEqual(EN13715.REm(h: 28, e: 28.5).y, 16.0)
        XCTAssertEqual(EN13715.REm(h: 30, e: 28.5).y, 18.0)
        XCTAssertEqual(EN13715.REm(h: 32, e: 28.5).y, 20.0)
    }


    func testRfa() {
        XCTAssertEqual(EN13715.Rfa(h: 28), 20.0)
        XCTAssertEqual(EN13715.Rfa(h: 30), 21.5)
        XCTAssertEqual(EN13715.Rfa(h: 32), 23.0)
        XCTAssertEqual(EN13715.Rfa(h: 28), 20.0)
        XCTAssertEqual(EN13715.Rfa(h: 30), 21.5)
        XCTAssertEqual(EN13715.Rfa(h: 32), 23.0)
    }


    func testS() {
        XCTAssertEqual(EN13715.S(h: 28, e: 32.5).x, -55)
        XCTAssertEqual(EN13715.S(h: 28, e: 31.5).x, -55.5)
        XCTAssertEqual(EN13715.S(h: 28, e: 30.5).x, -56)
        XCTAssertEqual(EN13715.S(h: 28, e: 29.5).x, -56.5)
        XCTAssertEqual(EN13715.S(h: 28, e: 28.5).x, -57)
        XCTAssertEqual(EN13715.S(h: 30, e: 32.5).x, -55)
        XCTAssertEqual(EN13715.S(h: 30, e: 31.5).x, -55.5)
        XCTAssertEqual(EN13715.S(h: 30, e: 30.5).x, -56)
        XCTAssertEqual(EN13715.S(h: 30, e: 29.5).x, -56.5)
        XCTAssertEqual(EN13715.S(h: 30, e: 28.5).x, -57)
        XCTAssertEqual(EN13715.S(h: 32, e: 32.5).x, -55)
        XCTAssertEqual(EN13715.S(h: 32, e: 31.5).x, -55.5)
        XCTAssertEqual(EN13715.S(h: 32, e: 30.5).x, -56)
        XCTAssertEqual(EN13715.S(h: 32, e: 29.5).x, -56.5)
        XCTAssertEqual(EN13715.S(h: 32, e: 28.5).x, -57)
        XCTAssertEqual(EN13715.S(h: 28, e: 32.5).y, 28.0)
        XCTAssertEqual(EN13715.S(h: 28, e: 31.5).y, 27.990)
        XCTAssertEqual(EN13715.S(h: 28, e: 30.5).y, 27.958)
        XCTAssertEqual(EN13715.S(h: 28, e: 29.5).y, 27.906)
        XCTAssertEqual(EN13715.S(h: 28, e: 28.5).y, 27.832)
        XCTAssertEqual(EN13715.S(h: 30, e: 32.5).y, 30.0)
        XCTAssertEqual(EN13715.S(h: 30, e: 31.5).y, 29.990)
        XCTAssertEqual(EN13715.S(h: 30, e: 30.5).y, 29.958)
        XCTAssertEqual(EN13715.S(h: 30, e: 29.5).y, 29.906)
        XCTAssertEqual(EN13715.S(h: 30, e: 28.5).y, 29.832)
        XCTAssertEqual(EN13715.S(h: 32, e: 32.5).y, 32.0)
        XCTAssertEqual(EN13715.S(h: 32, e: 31.5).y, 31.990)
        XCTAssertEqual(EN13715.S(h: 32, e: 30.5).y, 31.958)
        XCTAssertEqual(EN13715.S(h: 32, e: 29.5).y, 31.906)
        XCTAssertEqual(EN13715.S(h: 32, e: 28.5).y, 31.832)
    }


    func testT1() {
        XCTAssertEqual(EN13715.T1(e: 32.5).x, -0.5, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.T1(e: 28.5).x, -4.5, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.T1(e: 32.5).y, 0.013, accuracy: 0.0000001)
        XCTAssertEqual(EN13715.T1(e: 28.5).y, 0.013, accuracy: 0.0000001)
    }


    func testOneTo40() {
        if let oneTo40 = try? EN13715.profile(.eps, h: 30, e: 32.5, 10.0, wheelWidth: 140) {
            let points = oneTo40.profile(resolution: 0.5 )
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 3
            formatter.maximumFractionDigits = 3
            for point in points {
                print("\(formatter.string(from: point.x))\t\(formatter.string(from: point.y))")
            }
        }
    }
}



extension NumberFormatter {
    fileprivate func string(from double: Double) -> String {
        string(from: NSNumber(value: double)) ?? ""
    }
}
