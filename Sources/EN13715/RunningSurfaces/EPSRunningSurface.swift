//
//  EPS.swift
//  
//
//  Created by André Rohrbeck on 07.08.22.
//

import Foundation

/// The running surface of the EPS profile according EN 13715:2020, appendix D.
///
/// All co-ordinates are defined as x/y co-ordinates, where the standards foresees a y/z co-ordinate system according
/// to railway standards. The x-coordinates in the ``EPS``must thus be interpreted as y co-ordinates according to
/// EN 13715 and y-coordinates are z-co-ordinates according to the standard.
///
/// All measures are given in Millimeters in respect to the point ``D0``.
///
/// The name of internal variables, especially the points defined in the standard are written as they are shown in the
/// standard in respect to capitalisation.
internal struct EPSRunningSurface {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    public let e: Double

    /// The slope of the outer running surface in percent.
    public let slopePercent: Double

    /// The width of the wheel in Millimeters.
    public let wheelWidth: Double


    /// The center of the 100-mm-radius.
    public static let Jm = CGPoint(x: -6.5, y: 100.871)

    /// The center of the 330-mm-radius.
    public static let Jm1 = CGPoint(x: 19.0, y: 329.453)

    /// The starting point of the 100 mm radius.
    public static let C1b = CGPoint(x: -26.0, y: 2.79)

    /// The starting point of the 330 mm radius.
    public static let C11b = CGPoint(x: -17.587, y: 1.487)

    /// The end point of the 330 mm radius.
    public static let C12 = CGPoint(x: 19, y: -0.547)

    /// The point between the horizontal part and the outer slope.
    public static let B1b = CGPoint(x: 29, y: -0.547)

    /// The end point of the running surfaces slope.
    public var A1: CGPoint {
        EN13715.A1(B: EPSRunningSurface.B1b,
                            wheelWidth: wheelWidth,
                            slopePercent: slopePercent)
    }

    /// The end point of the chamfer.
    public var I: CGPoint {
        EN13715.I(A1: A1)
    }


    /// Creates a new ``EPSRunningSurface``.
    ///
    /// - Parameters:
    ///   - e: The width of the flange in Millimeters.
    ///   - slopePercent: The gradient of the outer running surface in %.
    ///   - wheelWidth: The width of the wheel in Millimeters.
    public init(e: Double, slopePercent: Double, wheelWidth: Double) {
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth
    }
}



extension EPSRunningSurface {
    public func profile(resolution: Double) -> [CGPoint] {
        transitionZone(resolution: resolution)
        + radius100mm(resolution: resolution)
        + radius330mm(resolution: resolution)
        + horizontal(resolution: resolution)
        + slope(resolution: resolution)
        + chamfer(resolution: resolution)
        + wheelFront(resolution: resolution)
    }


    private func transitionZone(resolution: Double) -> [CGPoint] {
        Sampler.resample(EPSTransitionZone.values(e: e), resolution: resolution)
    }


    private func radius100mm(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EPSRunningSurface.C1b,
                    to: EPSRunningSurface.C11b,
                    center: EPSRunningSurface.Jm,
                    radius: 100.0, resolution: resolution)
    }


    private func radius330mm(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EPSRunningSurface.C11b,
                    to: EPSRunningSurface.C12,
                    center: EPSRunningSurface.Jm1,
                    radius: 330.0,
                    resolution: resolution)
    }


    private func horizontal(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EPSRunningSurface.C12,
                             to: EPSRunningSurface.B1b,
                             resolution: resolution)
    }


    private func slope(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EPSRunningSurface.B1b,
                             to: EN13715.A1(B: EPSRunningSurface.B1b,
                                            wheelWidth: wheelWidth,
                                            slopePercent: slopePercent),
                             resolution: resolution)
    }


    private func chamfer(resolution: Double) -> [CGPoint] {
        return Sampler.straightLine(from: A1,
                                    to: I,
                                    resolution: resolution)
    }


    private func wheelFront(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: I,
                             to: CGPoint(x: I.x, y: I.y-10),
                             resolution: resolution)
    }
}
