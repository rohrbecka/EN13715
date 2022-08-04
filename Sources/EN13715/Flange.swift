//
//  Flange.swift
//  
//
//  Created by André Rohrbeck on 03.08.22.
//

import Foundation

/// The Flange shape according EN 13715:2020, appendix A.
///
/// All co-ordinates are defined as x/y co-ordinates, where the standards foresees a y/z co-ordinate system according
/// to railway standards. The x-coordinates in the ``Flange``must thus be interpreted as y co-ordinates according to
/// EN 13715 and y-coordinates are z-co-ordinates according to the standard.
///
/// All measures are given in Millimeters in respect to the point ``D0``.
///
/// The name of internal variables, especially the points defined in the standard are written as they are shown in the
/// standard in respect to capitalisation.
struct Flange {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    let e: Double

    /// The height of the flange in mm. Defined in a range of 28 to 32 mm.
    let h: Double

    /// The reduction of flange width in respect to a 32.5 mm flange width.
    let de: Double

    /// The point D1, which limits the flange are towards the running surface.
    internal let D1: CGPoint


    internal let E1: CGPoint
    

    /// Center Point of an arc with 13 mm radius
    internal let Dm: CGPoint


    internal let F1: CGPoint
    

    internal let G1: CGPoint

    /// The top of the flange.
    internal let S: CGPoint

    internal let H1: CGPoint

    /// The end of the flange on the inner side of the wheel (from here on the wheel is flat).
    internal let H2: CGPoint

    /// Center of an arc with 20.5 mm radius.
    internal let Hm: CGPoint

    /// Center of an arc with a radius of `Rfa`.
    internal let Fm: CGPoint

    /// Center of an arc with a radius of `RI` of 12 mm..
    internal let RIm: CGPoint

    /// Center of an arc with a radius of `RE` of 12 mm.
    internal let REm: CGPoint

    /// Radius of the outher area of the flange in mm. Depends on the height of the flange.
    internal let Rfa: Double


    /// Creates a new ``Flange`` with the given height and width.
    ///
    /// - Parameters:
    ///   - e: The flange width in mm.
    ///   - h: The flange height in mm.
    init(e: Double, h: Double) {
        self.e = e
        self.h = h

        self.de = 32.5 - e
        self.D1 = CGPoint(x: -35.0-de, y: 6.867)
        self.E1 = CGPoint(x: -38.427-de, y: 12.0)
        self.Dm = CGPoint(x: -26.211-de, y: 16.446)
        if h < 30 {
            self.F1 = CGPoint(x: (-40.530+39.765) / 2 * (h-28)-39.765-de, y: (17.779-15.675) / 2 * (h-28) + 15.675)
            self.G1 = CGPoint(x: (-47.758+49.663) / 2 * (h-28)-49.663-de, y: (27.568-26.748) / 2 * (h-28) + 26.748)
            self.Fm = CGPoint(x: (-60.733+58.558) / 2 * (h-28)-58.558-de, y: (10.425-8.835) / 2 * (h-28) + 8.835)
        } else {
            self.F1 = CGPoint(x: (-41.497+40.530) / 2 * (h-30)-40.530-de, y: (20.434-17.779) / 2 * (h-30) + 17.779)
            self.G1 = CGPoint(x: (-46.153+47.758) / 2 * (h-30)-47.758-de, y: (28.108-27.568) / 2 * (h-30) + 27.568)
            self.Fm = CGPoint(x: (-63.110+60.733) / 2 * (h-30)-60.733-de, y: (12.558-10.425) / 2 * (h-30) + 10.425)
        }

        self.S = CGPoint(x: Flange.Sx(e: e), y: Flange.Sy(e: e, h: h))
        self.H1 = CGPoint(x: -62.765, y: 25.149 + h - 28)
        self.H2 = CGPoint(x: -70.0, y: 9.519 + h - 28)
        self.Hm = CGPoint(x: -49.5, y: 9.519 + h - 28)
        self.RIm = CGPoint(x: -55, y: 16 + h - 28)
        self.REm = CGPoint(x: -55 - de, y: 16 + h - 28)
        self.Rfa = (h - 28) / 4.0 * 3.0 + 20.0
    }


    private static func Sx(e: Double) -> Double {
        -55 - (32.5 - e)/2.0
    }



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


// MARK: - Calculation of the profile points
extension Flange {
    /// Returns an Arra of ``CGPoint``s representing the complete flange from point ``H2``to
    /// point ``D1``. The arra  includes the point ``D1``.
    ///
    /// The returned array contains all characteristic points defined in the standard. Thus, the final resolution
    /// of the data is neither fixed nor equidistant. Nevertheless, the requested resolution is respected and there are no
    /// two niehgboring points returned, having a larger distance between each other than defined by ``resolution``.
    ///
    /// Distance is measured along the arc or the straight line.
    ///
    /// - Parameter resolution: The maximum allowed distance between two points in mm.
    func flangeProfile(resolution: Double) -> [CGPoint] {
        wheelBack(resolution: resolution)
        + flangeBack(resolution: resolution)
        + flangeInnerTop(resolution: resolution)
        + flangeOuterTop(resolution: resolution)
        + flangeOuter(resolution: resolution)
        + flange(resolution: resolution)
        + flangeRadius(resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the wheel back area until point ``H2``.
    ///
    /// The wheel back is a vertical straight line starting at a y position of -10 mm and ending at ``H2``.
    /// The returned array contains the point H2.
    func wheelBack(resolution: Double) -> [CGPoint] {
        let start = CGPoint(x: H2.x, y: H2.y - 10)
        return Sampler.straightLine(from: start, to: H2, resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the rear area of the flange from point ``H2``
    /// to ``H1``.
    ///
    /// This area consists of an arc with a radius of 20.5 mm and the center at ``Hm``
    /// The returned array contains the final point ``H1`` but not the point ``H2``.
    func flangeBack(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: H2, to: H1, center: Hm, radius: 20.5, resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the inner top area of the flange from point ``H1``
    /// to ``S``.
    ///
    /// This area consists of an arc with a radius of 12.0 mm and the center at ``RIm``
    /// The returned array contains the final point ``S`` but not the point ``H1``.
    func flangeInnerTop(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: H1, to: S, center: RIm, radius: 12.0, resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the outer top area of the flange from point ``S``
    /// to ``G1``.
    ///
    /// This area consists of an arc with a radius of 12.0 mm and the center at ``REm``
    /// The returned array contains the final point ``G1`` but not the point ``S``.
    func flangeOuterTop(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: S, to: G1, center: REm, radius: 12.0, resolution: resolution)
    }


    /// Returns an Array of ``CGPoint``s representing the outer area of the flange from point ``G1``
    /// to ``F1``.
    ///
    /// This area consists of an arc with a radius of ``Rfa`` and the center at ``Fm``
    /// The returned array contains the final point ``F1`` but not the point ``G1``.
    func flangeOuter(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: G1, to: F1, center: Fm, radius: Rfa, resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the straight part of the flange from point ``F1``
    /// to ``E1``.
    ///
    /// This area consists of a straight line. The angle of this line is also known as *flange angle*.
    /// The returned array contains the final point ``E1`` but not the point ``F1``.
    func flange(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: F1, to: E1, resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the  flange radius from point ``E1``
    /// to ``D1``.
    ///
    /// This area consists of an arc with a radius of 13 mm and a center at ``Dm``.
    /// The returned array contains the final point ``D1`` but not the point ``E1``.
    func flangeRadius(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: E1, to: D1, center: Dm, radius: 12.0, resolution: resolution)
    }

}
