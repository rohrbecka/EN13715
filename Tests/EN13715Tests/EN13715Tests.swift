import XCTest
import EN13715

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



    func testOneTo40() {
        if let oneTo40 = try? EN13715.profile(.eps, h: 30, e: 32.5, 10.0, wheelWidth: 140) {
            let points = oneTo40.profile(resolution: 0.5 )
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 3
            formatter.maximumFractionDigits = 3
            for point in points {
                print("\(formatter.string(from: NSNumber(value: point.x)) ?? "")\t\(formatter.string(from: NSNumber(value: point.y)) ?? "")")
            }
        }
    }
}
