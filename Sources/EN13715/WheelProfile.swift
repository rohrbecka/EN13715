//
//  WheelProfile.swift
//  
//
//  Created by André Rohrbeck on 08.08.22.
//

import Foundation

/// A railway wheel profile.
public protocol WheelProfile: CustomStringConvertible {
    /// The flange height in Millimeters.
    var h: Double { get }

    /// The flange width in Millimeters.
    var e: Double { get }

    /// The gradient of the outer running surface in %.
    var slopePercent: Double { get }

    /// The width of the wheel in Millimeters.
    var wheelWidth: Double { get }

    /// The profile name according EN 13715.
    var description: String { get }

    /// Returns the profile as array of x-y-values.
    ///
    /// The distance between neighboring points returned is guaranteed to be smaller than ``resolution``.
    ///
    /// - Parameter resolution: The maximum allowerd distance between two neighboring points.
    /// - Returns: An array of ``CGPoint``s representing the profiles.
    func profile(resolution: Double) -> [CGPoint]

    func profile() -> [CGPoint]
}



extension WheelProfile {
    /// Returns the String showing the parameters of the profile (flange height, flange width and slope)
    /// as described in EN 13715.
    /// - Parameters:
    ///   - h: The flange height in Millimeters.
    ///   - e: The flange width in Millimeters.
    ///   - slopePercent: The gradient of the outer running surface area in %.
    internal func parameterString(h: Double, e: Double, _ slopePercent: Double) -> String {
        "h\(h.formatted(doubleFormatter)) / e\(e.formatted(doubleFormatter)) / \(slopePercent.formatted(doubleFormatter)) %"
    }


    /// A formatter for formatting ``Double`` numbers with 0 or 1 fraction digit to match the display in the
    /// ``parameterString`` of the profile description according EN 13715.
    private var doubleFormatter: FloatingPointFormatStyle<Double> {
        FloatingPointFormatStyle.number.precision(.fractionLength(0...1))
    }
}
