//
//  EPS.swift
//  
//
//  Created by André Rohrbeck on 08.08.22.
//

import Foundation

/// The EPS profile according EN 13715.
internal struct EPS: WheelProfile {

    public var h: Double

    public var e: Double

    public var slopePercent: Double

    public var wheelWidth: Double

    /// The flange definition.
    private var flange: Flange

    /// The running surfae definition.
    private var runningSurface: EPSRunningSurface


    /// Creates a new EPS profile.
    ///
    /// - Parameters:
    ///   - h: The flange height in Millimeters.
    ///   - e: The flange width in Millimeters.
    ///   - slopePercent: The gradient of the outer running surface in %.
    ///   - wheelWidth: The wheel width in Millimeters.
    ///
    /// - Throws: An ``InvalidRangeError`` if one of the parameters is outside of its valid range.
    init(h: Double, e: Double, _ slopePercent: Double, wheelWidth: Double = 135) throws {
        guard EN13715.validHRange.contains(h) else {
            throw InvalidRangeError.h
        }
        guard EN13715.validERange.contains(e) else {
            throw InvalidRangeError.e
        }
        guard EN13715.validSlopeRange.contains(slopePercent) else {
            throw InvalidRangeError.slope
        }
        self.h = h
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth

        flange = Flange(e: e, h: h)
        runningSurface = EPSRunningSurface(e: e, slopePercent: slopePercent, wheelWidth: wheelWidth)
    }


    public var description: String {
        return "EN 13715 — EPS / \(parameterString(h: h, e: e, slopePercent))"
    }


    public func profile() -> [CGPoint] {
        profile(resolution: 0.5)
    }


    public func profile(resolution: Double) -> [CGPoint] {
        return flange.profile(resolution: resolution)
        + runningSurface.profile(resolution: resolution)
    }
}
