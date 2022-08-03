import Foundation


/// The Profiles as defined in EN 13715:2020-10.
public enum EN13715 {
    /// The 1/40 profile.
    case oneTo40(h: Double, e: Double, _ slopePercent: Double)

    /// The S1002 profile.
    case S1002(h: Double, e: Double, _ slopePercent: Double)

    /// The EPS profile.
    case EPS(h: Double, e: Double, _ slopePercent: Double)
}



extension EN13715: CustomStringConvertible {
    /// The profile name according EN 13715.
    public var description: String {
        switch self {
        case .oneTo40(let h, let e, let slopePercent):
            return "EN 13715 — 1/40 / \(parameterString(h: h, e: e, slopePercent))"
        case .S1002(let h, let e, let slopePercent):
            return "EN 13715 — S1002 / \(parameterString(h: h, e: e, slopePercent))"
        case .EPS(let h, let e, let slopePercent):
            return "EN 13715 — EPS / \(parameterString(h: h, e: e, slopePercent))"
        }
    }


    private func parameterString(h: Double, e: Double, _ slopePercent: Double) -> String {
        "h\(h.formatted(doubleFormatter)) / e\(e.formatted(doubleFormatter)) / \(slopePercent.formatted(doubleFormatter)) %"
    }



    private var doubleFormatter: FloatingPointFormatStyle<Double> {
        FloatingPointFormatStyle.number.precision(.fractionLength(0...1))
    }
}
