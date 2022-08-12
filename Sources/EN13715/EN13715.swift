//
//  EN13715.swift
//
//
//  Created by André Rohrbeck on 08.08.22.
//
import Foundation


/// The Profiles as defined in EN 13715:2020-10.
public enum EN13715 {
    /// Creates a wheel profile defined in EN 13715.
    ///
    /// - Parameters:
    ///   - type: The type of wheel profile to be created.
    ///   - h: The flange height in Millimeters.
    ///   - e: The flange width in Millimeters.
    ///   - slopePercent: The gradient of the outer running surface in %.
    ///   - wheelWidth: The width of the wheel in Millimeters.
    ///
    /// - Throws : An ``InvalidRangeError`` if one of the parameters is outside of its valid range.
    public static func profile(_ type: WheelProfileType,
                               h: Double,
                               e: Double,
                               _ slopePercent: Double,
                               wheelWidth: Double = 135) throws -> WheelProfile {
        switch type {
        case .oneTo40:
            return try OneTo40(h: h, e: e, slopePercent, wheelWidth: wheelWidth)
        case .s1002:
            return try S1002(h: h, e: e, slopePercent, wheelWidth: wheelWidth)
        case .eps:
            return try EPS(h: h, e: e, slopePercent, wheelWidth: wheelWidth)
        }
    }


    
// MARK: - Valid Ranges
    /// The range of valid flange heights in Millimeters.
    public static let validHRange = 28.0...32.0

    /// The range of valid flange widths in Millimeters.
    public static let validERange = 28.5...32.5

    /// The range of valid outer running surface gradients in %.
    public static let validSlopeRange = 6.7...15.0
}


// MARK: - Calculation of Characteristic Points
extension EN13715 {
    internal static func A1(B: CGPoint,
                            wheelWidth: Double,
                            slopePercent: Double) -> CGPoint {
        CGPoint(x: wheelWidth - 70.0 - 5.0,
                y: B.y - slopePercent/100.0 * (wheelWidth - 70 - B.x - 5))
    }


    internal static var B1a: CGPoint {
        CGPoint(x: 35.0, y: -0.875)
    }

    internal static func C1a(e: Double) -> CGPoint {
        CGPoint(x: -26.0 - (32.5-e), y: 2.187)
    }

    /// The limit between the 36-mm-radius and the 1:40 running surface.
    internal static func C11a(e: Double) -> CGPoint {
        CGPoint(x: -15.640 - (32.5-e), y: 0.391)
    }

    internal static var D0 = CGPoint(x: 0.0, y: 0.0)

    /// The point D1, which limits the flange are towards the running surface.
    internal static func D1(e: Double) -> CGPoint {
        CGPoint(x: -35.0 - (32.5-e), y: 6.867)
    }

    /// The end of the 13 mm flange radius, starting in the flange area of the 1/40 profile.
    internal static func D1a(e: Double) -> CGPoint {
        CGPoint(x: -32.696 - (32.5-e), y: 5.180)
    }

    /// Center Point of an arc with 13 mm radius
    internal static func Dm(e: Double) -> CGPoint {
        CGPoint(x: -26.211 - (32.5-e), y: 16.446)
    }

    internal static func E1(e: Double) -> CGPoint {
        CGPoint(x: -38.427 - (32.5-e), y: 12.0)
    }

    internal static func F1(h: Double, e: Double) -> CGPoint {
        if h < 30 {
            return CGPoint(x: (-40.530+39.765) / 2 * (h-28)-39.765-(32.5 - e),
                           y: (17.779-15.675) / 2 * (h-28) + 15.675)
        } else {
            return CGPoint(x: (-41.497+40.530) / 2 * (h-30)-40.530-(32.5 - e),
                           y: (20.434-17.779) / 2 * (h-30) + 17.779)
        }
    }

    internal static func Fm(h: Double, e: Double) -> CGPoint {
        if h < 30 {
            return CGPoint(x: (-60.733+58.558) / 2 * (h-28)-58.558-(32.5 - e),
                           y: (10.425-8.835) / 2 * (h-28) + 8.835)
        } else {
            return CGPoint(x: (-63.110+60.733) / 2 * (h-30)-60.733-(32.5 - e),
                           y: (12.558-10.425) / 2 * (h-30) + 10.425)
        }
    }

    internal static func G1(h: Double, e: Double) -> CGPoint {
        if h < 30 {
            return CGPoint(x: (-47.758+49.663) / 2 * (h-28)-49.663-(32.5 - e),
                           y: (27.568-26.748) / 2 * (h-28) + 26.748)
        } else {
            return CGPoint(x: (-46.153+47.758) / 2 * (h-30)-47.758-(32.5 - e),
                           y: (28.108-27.568) / 2 * (h-30) + 27.568)
        }
    }

    internal static func H1(h: Double) -> CGPoint {
        CGPoint(x: -62.765, y: 25.149 + h - 28)
    }

    /// The end of the flange on the inner side of the wheel (from here on the wheel is flat).
    internal static func H2(h: Double) -> CGPoint {
        CGPoint(x: -70.0, y: 9.519 + h - 28)
    }


    /// Center of an arc with 20.5 mm radius.
    internal static func Hm(h: Double) -> CGPoint {
        CGPoint(x: -49.5, y: 9.519 + h - 28)
    }


    internal static func I(A1: CGPoint) -> CGPoint {
        CGPoint(x: A1.x + 5.0, y: A1.y - 5.0)
    }

    /// Center of an arc with a radius of `RI` of 12 mm..
    internal static func RIm(h: Double) -> CGPoint {
        CGPoint(x: -55, y: 16 + h - 28)
    }


    /// Center of an arc with a radius of `RE` of 12 mm.
    internal static func REm(h: Double, e: Double) -> CGPoint {
        CGPoint(x: -55 - (32.5 - e), y: 16 + h - 28)
    }

    /// Radius of the outher area of the flange in mm. Depends on the height of the flange.
    internal static func Rfa(h: Double) -> Double {
        (h - 28) / 4.0 * 3.0 + 20.0
    }


    internal static func S(h: Double, e: Double) -> CGPoint {
        CGPoint(x: EN13715.Sx(e: e), y: EN13715.Sy(e: e, h: h))
    }


    internal static func T1(e: Double) -> CGPoint {
        CGPoint(x: -0.5 - (32.5-e), y: 0.013)
    }

    /// Calculates the x co-ordinate of the top of flange (point ``S``).
    ///
    /// - Parameter e: The flange width in mm.
    /// - Returns: The x co-ordinate of ``S`` in milimeters.
    private static func Sx(e: Double) -> Double {
        -55 - (32.5 - e)/2.0
    }

    /// Calculates the y co-ordinate of the top of flange (point ``S``).
    ///
    /// - Parameter e: The flange width in mm.
    /// - Parameter h: The flange height in mm
    /// - Returns: The y co-ordinate of ``S`` in milimeters.
    private static func Sy(e: Double, h: Double) -> Double {
        let reduction: Double
        if e > 31.5 {
            reduction = 0 + (32.5 - e) * 0.01
        } else if e > 30.5 {
            reduction = 0.01 + (31.5 - e) * 0.032
        } else if e > 29.5 {
            reduction = 0.042 + (30.5 - e) * 0.052
        } else {
            reduction = 0.094 + (29.5 - e) * 0.074
        }
        return h - reduction
    }

}
