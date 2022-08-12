//
//  OneTo40RunningSurface.swift
//  
//
//  Created by André Rohrbeck on 04.08.22.
//

import Foundation

/// The running surface of the 1/40 profile according EN 13715:2020, appendix B.
///
/// All co-ordinates are defined as x/y co-ordinates, where the standards foresees a y/z co-ordinate system according
/// to railway standards. The x-coordinates in the ``Flange``must thus be interpreted as y co-ordinates according to
/// EN 13715 and y-coordinates are z-co-ordinates according to the standard.
///
/// All measures are given in Millimeters in respect to the point ``D0``.
///
/// The name of internal variables, especially the points defined in the standard are written as they are shown in the
/// standard in respect to capitalisation.
internal struct OneTo40RunningSurface {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    public let e: Double

    /// The slope of the outer running surface in percent.
    public let slopePercent: Double

    /// The width of the wheel in Millimeters.
    public let wheelWidth: Double

    /// The beginning of the 5 x 5 mm chamfer 5 mm away from the outer wheel surface.
    internal let A1: CGPoint

    /// The end of the 5 x 5 mm chamfer on the outer wheel surface.
    internal let I: CGPoint

    /// The center of the 36-mm-radius between points ``D1a`` and ``C11a``.
    internal static func Jm(e: Double) -> CGPoint {
        CGPoint(x: -14.740 - (32.5-e), y: 36.38)
    }

    public init(e: Double, slopePercent: Double, wheelWidth: Double) {
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth
        self.A1 = CGPoint(x: wheelWidth - 70.0 - 5.0,
                          y: EN13715.B1a.y - slopePercent/100.0 * (wheelWidth - 110.0))
        self.I = CGPoint(x: wheelWidth - 70.0, y: A1.y - 5.0)
    }
}


// MARK: Calculation of the profile points
extension OneTo40RunningSurface {
    internal func profile(resolution: Double) -> [CGPoint] {
        flangeRadius(resolution: resolution)
        + transitionRadius(resolution: resolution)
        + innerRunningSurface(resolution: resolution)
        + TD0(resolution: resolution)
        + outerRunningSurface(resolution: resolution)
        + slope(resolution: resolution)
        + chamfer(resolution: resolution)
        + wheelFront(resolution: resolution)
    }


    private func flangeRadius(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.D1(e: e),
                    to: EN13715.D1a(e: e),
                    center: EN13715.Dm(e: e),
                    radius: 13.0,
                    resolution: resolution)
    }


    private func transitionRadius(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.D1a(e: e),
                    to: EN13715.C11a(e: e),
                    center: OneTo40RunningSurface.Jm(e: e),
                    radius: 36.0,
                    resolution: resolution)
    }


    private func innerRunningSurface(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EN13715.C11a(e: e),
                             to: EN13715.T1(e: e),
                             resolution: resolution)
    }


    private func TD0(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EN13715.T1(e: e),
                             to: EN13715.D0,
                             resolution: resolution)
    }


    private func outerRunningSurface(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EN13715.D0,
                             to: EN13715.B1a,
                             resolution: resolution)
    }


    private func slope(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EN13715.B1a,
                             to: A1,
                             resolution: resolution)
    }


    private func chamfer(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: A1, to: I, resolution: resolution)
    }


    private func wheelFront(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: I, to: CGPoint(x: I.x, y: I.y-10), resolution: resolution)
    }
}
