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
internal struct Flange {

    /// The width of the flange in mm. Defined in a range of 28.5 to 32.5.
    public let e: Double

    /// The height of the flange in mm. Defined in a range of 28 to 32 mm.
    public let h: Double


    /// Creates a new ``Flange`` with the given height and width.
    ///
    /// - Parameters:
    ///   - e: The flange width in mm.
    ///   - h: The flange height in mm.
    public init(e: Double, h: Double) {
        self.e = e
        self.h = h
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
    public func profile(resolution: Double) -> [CGPoint] {
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
    private func wheelBack(resolution: Double) -> [CGPoint] {
        let start = CGPoint(x: EN13715.H2(h: h).x,
                            y: EN13715.H2(h: h).y - 10)
        return Sampler.straightLine(from: start,
                                    to: EN13715.H2(h: h),
                                    resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the rear area of the flange from point ``H2``
    /// to ``H1``.
    ///
    /// This area consists of an arc with a radius of 20.5 mm and the center at ``Hm``
    /// The returned array contains the final point ``H1`` but not the point ``H2``.
    private func flangeBack(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.H2(h: h),
                    to: EN13715.H1(h: h),
                    center: EN13715.Hm(h: h),
                    radius: 20.5,
                    negativeDirection: true,
                    resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the inner top area of the flange from point ``H1``
    /// to ``S``.
    ///
    /// This area consists of an arc with a radius of 12.0 mm and the center at ``RIm``
    /// The returned array contains the final point ``S`` but not the point ``H1``.
    private func flangeInnerTop(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.H1(h: h),
                    to: EN13715.S(h: h, e: e),
                    center: EN13715.RIm(h: h),
                    radius: 12.0,
                    negativeDirection: true,
                    resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the outer top area of the flange from point ``S``
    /// to ``G1``.
    ///
    /// This area consists of an arc with a radius of 12.0 mm and the center at ``REm``
    /// The returned array contains the final point ``G1`` but not the point ``S``.
    private func flangeOuterTop(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.S(h: h, e: e),
                    to: EN13715.G1(h: h, e: e),
                    center: EN13715.REm(h: h, e: e),
                    radius: 12.0,
                    negativeDirection: true,
                    resolution: resolution)
    }


    /// Returns an Array of ``CGPoint``s representing the outer area of the flange from point ``G1``
    /// to ``F1``.
    ///
    /// This area consists of an arc with a radius of ``Rfa`` and the center at ``Fm``
    /// The returned array contains the final point ``F1`` but not the point ``G1``.
    private func flangeOuter(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.G1(h: h, e: e),
                    to: EN13715.F1(h: h, e: e),
                    center: EN13715.Fm(h: h, e: e),
                    radius: EN13715.Rfa(h: h),
                    negativeDirection: true,
                    resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the straight part of the flange from point ``F1``
    /// to ``E1``.
    ///
    /// This area consists of a straight line. The angle of this line is also known as *flange angle*.
    /// The returned array contains the final point ``E1`` but not the point ``F1``.
    private func flange(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: EN13715.F1(h: h, e: e),
                             to: EN13715.E1(e: e),
                             resolution: resolution)
    }

    /// Returns an Array of ``CGPoint``s representing the  flange radius from point ``E1``
    /// to ``D1``.
    ///
    /// This area consists of an arc with a radius of 13 mm and a center at ``Dm``.
    /// The returned array contains the final point ``D1`` but not the point ``E1``.
    private func flangeRadius(resolution: Double) -> [CGPoint] {
        Sampler.arc(from: EN13715.E1(e: e),
                    to: EN13715.D1(e: e),
                    center: EN13715.Dm(e: e),
                    radius: 13.0,
                    resolution: resolution)
    }
}
