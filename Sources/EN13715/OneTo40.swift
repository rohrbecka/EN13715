//
//  OneTo40.swift
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
internal struct OneTo40 {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    let e: Double

    let slopePercent: Double

    let wheelWidth: Double

    /// The reduction of flange width in respect to a 32.5 mm flange width.
    let de: Double

    /// The center of the 36-mm-radius between points ``D1a`` and ``C11a``.
    let Jm: CGPoint

    /// The border to the ``Flange`` area.
    let D1: CGPoint

    /// The end of the 13 mm flange radius, starting in the flange area.
    let D1a: CGPoint

    /// The center of the 13 mm flange radius.
    let Dm: CGPoint


    let C1a: CGPoint

    /// The limit between the 36-mm-radius and the 1:40 running surface.
    let C11a: CGPoint


    let T1: CGPoint

    let D0: CGPoint

    /// The beginning of the outer slope.
    let B1a: CGPoint


    /// The beginning of the 5 x 5 mm chamfer 5 mm away from the outer wheel surface.
    let A1: CGPoint

    /// The end of the 5 x 5 mm chamfer on the outer wheel surface.
    let I: CGPoint


    init(e: Double, slopePercent: Double, wheelWidth: Double) {
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
