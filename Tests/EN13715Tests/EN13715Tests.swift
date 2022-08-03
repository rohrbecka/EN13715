import XCTest
@testable import EN13715

final class EN13715Tests: XCTestCase {
    func testProfileDescription() {
        let oneTo40 = EN13715.oneTo40(h: 28, e: 30.5, 15)
        XCTAssertEqual(oneTo40.description, "EN 13715 — 1/40 / h28 / e30,5 / 15 %")

        let s1002 = EN13715.S1002(h: 30, e: 30, 15)
        XCTAssertEqual(s1002.description, "EN 13715 — S1002 / h30 / e30 / 15 %")

        let eps = EN13715.EPS(h: 32, e: 28.5, 10)
        XCTAssertEqual(eps.description, "EN 13715 — EPS / h32 / e28,5 / 10 %")
    }
}
