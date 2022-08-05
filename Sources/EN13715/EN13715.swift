import Foundation


/// The Profiles as defined in EN 13715:2020-10.
public enum EN13715 {
    /// The 1/40 profile.
    case oneTo40(h: Double, e: Double, _ slopePercent: Double, wheelWidth: Double = 135)

    /// The S1002 profile.
    case S1002(h: Double, e: Double, _ slopePercent: Double, wheelWidth: Double = 135)

    /// The EPS profile.
    case EPS(h: Double, e: Double, _ slopePercent: Double, wheelWidth: Double = 135)
}



extension EN13715: CustomStringConvertible {
    /// The profile name according EN 13715.
    public var description: String {
        switch self {
        case .oneTo40(let h, let e, let slopePercent, _):
            return "EN 13715 — 1/40 / \(parameterString(h: h, e: e, slopePercent))"
        case .S1002(let h, let e, let slopePercent, _):
            return "EN 13715 — S1002 / \(parameterString(h: h, e: e, slopePercent))"
        case .EPS(let h, let e, let slopePercent, _):
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



extension EN13715 {
    public func profile(resolution: Double = 0.5) -> [CGPoint] {
        switch self {
        case .oneTo40(let h, let e, let slope, let wheelWidth):
            let flange = Flange(e: e, h: h)
            let runningSurface = OneTo40(e: e, slopePercent: slope, wheelWidth: wheelWidth)
            return flange.profile(resolution: resolution) + runningSurface.profile(resolution: resolution)
        case .S1002(let h, let e, let slope, let wheelWidth):
            let flange = Flange(e: e, h: h)
            return flange.profile(resolution: resolution)
        case .EPS(let h, let e, let slope, let wheelWidth):
            let flange = Flange(e: e, h: h)
            return flange.profile(resolution: resolution)
        }
    }

}
