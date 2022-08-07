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
internal struct EPS {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    public let e: Double

    /// The slope of the outer running surface in percent.
    public let slopePercent: Double

    /// The width of the wheel in Millimeters.
    public let wheelWidth: Double


    /// The center of the 100-mm-radius.
    internal let Jm = CGPoint(x: -6.5, y: 100.871)

    /// The center of the 330-mm-radius.
    internal let Jm1 = CGPoint(x: 19.0, y: 329.453)

    /// The starting point of the 100 mm radius.
    internal let C1b = CGPoint(x: -26.0, y: 2.79)

    /// The starting point of the 330 mm radius.
    internal let C11b = CGPoint(x: -17.587, y: 1.487)

    /// The end point of the 330 mm radius.
    internal let C12 = CGPoint(x: 19, y: -0.547)

    /// The point between the horizontal part and the outer slope.
    internal let B1b = CGPoint(x: 29, y: -0.547)

    /// The end of the outer slope and the beginning of the chamfer.
    internal let A1: CGPoint

    /// The end point of the chamfer.
    internal let I: CGPoint


    public init(e: Double, slopePercent: Double, wheelWidth: Double) {
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth
        self.A1 = CGPoint(x: wheelWidth - 70.0 - 5.0, y: B1b.y - slopePercent/100.0 * (wheelWidth - 70 - B1b.x - 5))
        self.I = CGPoint(x: wheelWidth - 70.0, y: A1.y - 5.0) // TODO: double code
    }
}



extension EPS {
    func profile(resolution: Double) -> [CGPoint] {
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
        Sampler.arc(from: C1b, to: C11b, center: Jm, radius: 100.0, resolution: resolution)
    }


    private func radius330mm(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: C11b, to: C12, center: Jm1, radius: 330.0, resolution: resolution)
    }


    private func horizontal(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: C12, to: B1b, resolution: resolution)
    }


    private func slope(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: B1b, to: A1, resolution: resolution)
    }


    private func chamfer(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: A1, to: I, resolution: resolution)
    }


    private func wheelFront(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: I, to: CGPoint(x: I.x, y: I.y-10), resolution: resolution)
    }
}
