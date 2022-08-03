//
//  Flange.swift
//  
//
//  Created by André Rohrbeck on 03.08.22.
//

import Foundation

/// The flange shape according EN 13715:2020, appendix A.
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
