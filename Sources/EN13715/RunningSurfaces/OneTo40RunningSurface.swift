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
internal struct OneTo40RunningSurface: RunningSurface {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    public let e: Double

    /// The slope of the outer running surface in percent.
    public let slopePercent: Double

    /// The width of the wheel in Millimeters.
    public let wheelWidth: Double

    /// The reduction of flange width in respect to a 32.5 mm flange width.
    internal let de: Double

    /// The center of the 36-mm-radius between points ``D1a`` and ``C11a``.
    internal let Jm: CGPoint

    /// The border to the ``Flange`` area.
    internal let D1: CGPoint

    /// The end of the 13 mm flange radius, starting in the flange area.
    internal let D1a: CGPoint

    /// The center of the 13 mm flange radius.
    internal let Dm: CGPoint


    internal let C1a: CGPoint

    /// The limit between the 36-mm-radius and the 1:40 running surface.
    internal let C11a: CGPoint


    internal let T1: CGPoint

    internal let D0: CGPoint

    /// The beginning of the outer slope.
    internal let B1a: CGPoint

    /// The beginning of the 5 x 5 mm chamfer 5 mm away from the outer wheel surface.
    internal let A1: CGPoint

    /// The end of the 5 x 5 mm chamfer on the outer wheel surface.
    internal let I: CGPoint


    public init(e: Double, slopePercent: Double, wheelWidth: Double) {
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth

        let flange = Flange(e: e, h: 30) // 30 used as dummy, is not relevant
        // TODO: this is not nice... think on static calculation functions in Flange.

        self.de = 32.5 - e
        self.Jm = CGPoint(x: -14.740 - de, y: 36.38)
        self.D1 = flange.D1
        self.D1a = CGPoint(x: -32.696 - de, y: 5.180)
        self.Dm = flange.Dm
        self.C1a = CGPoint(x: -26.0 - de, y: 2.187)
        self.C11a = CGPoint(x: -15.640 - de, y: 0.391)
        self.T1 = CGPoint(x: -0.5 - de, y: 0.013)
        self.D0 = CGPoint(x: 0.0, y: 0.0)
        self.B1a = CGPoint(x: 35.0, y: -0.875)
        self.A1 = CGPoint(x: wheelWidth - 70.0 - 5.0, y: B1a.y - slopePercent/100.0 * (wheelWidth - 110.0))
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
        Sampler.arc(from: D1, to: D1a, center: Dm, radius: 13.0, resolution: resolution)
    }



    private func transitionRadius(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: D1a, to: C11a, center: Jm, radius: 36.0, resolution: resolution)
    }


    private func innerRunningSurface(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: C11a, to: T1, resolution: resolution)
    }


    private func TD0(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: T1, to: D0, resolution: resolution)
    }


    private func outerRunningSurface(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: D0, to: B1a, resolution: resolution)
    }


    private func slope(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: B1a, to: A1, resolution: resolution)
    }


    private func chamfer(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: A1, to: I, resolution: resolution)
    }


    private func wheelFront(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: I, to: CGPoint(x: I.x, y: I.y-10), resolution: resolution)
    }
}
