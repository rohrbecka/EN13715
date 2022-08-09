//
//  S1002.swift
//  
//
//  Created by André Rohrbeck on 08.08.22.
//
import Foundation

/// The S1002 profile according EN 13715.
internal struct S1002: WheelProfile {

    public let h: Double

    public let e: Double

    public let slopePercent: Double

    public let wheelWidth: Double

    /// The flange definition.
    public let flange: Flange

    /// The running surface definition.
    public let runningSurface: RunningSurface

    /// Creates a new S1002 profile with the given parameters.
    ///
    /// - Parameters:
    ///   - h: The flange height in Millimeters.
    ///   - e: The flange width in Millimeters.
    ///   - slopePercent: The gradient of the outer running surface in %.
    ///   - wheelWidth: The width of the wheel in Millimeters.
    ///
    /// - Throws : An ``InvalidRangeError`` if one of the parameters is outside of its valid range.
    init(h: Double, e: Double, _ slopePercent: Double, wheelWidth: Double) throws {
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
        runningSurface = S1002RunningSurface(e: e, slopePercent: slopePercent, wheelWidth: wheelWidth)
    }


    public var description: String {
        return "EN 13715 — S1002 / \(parameterString(h: h, e: e, slopePercent))"
    }


    public func profile() -> [CGPoint] {
        profile(resolution: 0.5)
    }

    
    public func profile(resolution: Double = 0.5) -> [CGPoint] {
        return flange.profile(resolution: resolution)
        + runningSurface.profile(resolution: resolution)
    }
}
