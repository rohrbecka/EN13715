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
