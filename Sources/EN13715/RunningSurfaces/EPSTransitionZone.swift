//
//  EPSTransitionZone.swift
//  
//
//  Created by André Rohrbeck on 07.08.22.
//

import Foundation

/// The transition zone of the EPS profile between points D1 and C1b according to
/// table D.1 in EN 13715:2020.
///
/// The transition zone of the EPS profile is given as a table for flange widths between
/// 28.5 and 32.5 mm with a resolution of 0.5 mm.  For other flange widths between 28.5 and
/// 32.5 mm the points are interpolated.
internal enum EPSTransitionZone {

    /// The points according table D.1 in EN 13715:2020 for a flange width of 32.5 mm.
    private static let e32_5 = EPSTransitionZoneSample(e: 32.5,
                                                       D1x: -35.0,
                                                       values: [6.867,
                                                                6.466,
                                                                6.108,
                                                                5.788,
                                                                5.507,
                                                                5.262,
                                                                5.044,
                                                                4.832,
                                                                4.624,
                                                                4.421,
                                                                4.222,
                                                                4.028,
                                                                3.838,
                                                                3.652,
                                                                3.471,
                                                                3.295,
                                                                3.122,
                                                                2.954,
                                                                2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 32.0 mm.
    private static let e32 = EPSTransitionZoneSample(e: 32.0,
                                                     D1x: -35.5,
                                                     values: [6.867,
                                                              6.466,
                                                              6.104,
                                                              5.781,
                                                              5.493,
                                                              5.239,
                                                              5.018,
                                                              4.822,
                                                              4.631,
                                                              4.444,
                                                              4.260,
                                                              4.081,
                                                              3.906,
                                                              3.735,
                                                              3.567,
                                                              3.404,
                                                              3.245,
                                                              3.089,
                                                              2.938,
                                                              2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 31.5 mm.
    private static let e31_5 = EPSTransitionZoneSample(e: 31.5,
                                                       D1x: -36.0,
                                                       values: [6.867,
                                                                6.466,
                                                                6.104,
                                                                5.778,
                                                                5.486,
                                                                5.227,
                                                                4.998,
                                                                4.799,
                                                                4.622,
                                                                4.449,
                                                                4.281,
                                                                4.116,
                                                                3.954,
                                                                3.796,
                                                                3.642,
                                                                3.491,
                                                                3.344,
                                                                3.200,
                                                                3.060,
                                                                2.923,
                                                                2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 31.0 mm.
    private static let e31 = EPSTransitionZoneSample(e: 31.0,
                                                     D1x: -36.5,
                                                     values: [6.867,
                                                              6.467,
                                                              6.105,
                                                              5.778,
                                                              5.484,
                                                              5.221,
                                                              4.987,
                                                              4.781,
                                                              4.602,
                                                              4.442,
                                                              4.286,
                                                              4.134,
                                                              3.985,
                                                              3.840,
                                                              3.697,
                                                              3.558,
                                                              3.422,
                                                              3.289,
                                                              3.160,
                                                              3.033,
                                                              2.910,
                                                              2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 30.5 mm.
    private static let e30_5 = EPSTransitionZoneSample(e: 30.5,
                                                       D1x: -37.0,
                                                       values: [6.867,
                                                                6.468,
                                                                6.107,
                                                                5.780,
                                                                5.486,
                                                                5.220,
                                                                4.983,
                                                                4.772,
                                                                4.586,
                                                                4.424,
                                                                4.280,
                                                                4.140,
                                                                4.003,
                                                                3.868,
                                                                3.737,
                                                                3.609,
                                                                3.483,
                                                                3.360,
                                                                3.240,
                                                                3.124,
                                                                3.010,
                                                                2.898,
                                                                2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 30.0 mm.
    private static let e30 = EPSTransitionZoneSample(e: 30.0,
                                                     D1x: -37.5,
                                                     values: [6.867,
                                                              6.476,
                                                              6.122,
                                                              5.802,
                                                              5.513,
                                                              5.251,
                                                              5.016,
                                                              4.806,
                                                              4.619,
                                                              4.454,
                                                              4.310,
                                                              4.176,
                                                              4.046,
                                                              3.918,
                                                              3.793,
                                                              3.671,
                                                              3.552,
                                                              3.435,
                                                              3.321,
                                                              3.209,
                                                              3.100,
                                                              2.994,
                                                              2.891,
                                                              2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 29.5 mm.
    private static let e29_5 = EPSTransitionZoneSample(e: 29.5,
                                                       D1x: -38.0,
                                                       values: [6.867,
                                                                6.469,
                                                                6.110,
                                                                5.785,
                                                                5.490,
                                                                5.225,
                                                                4.985,
                                                                4.769,
                                                                4.576,
                                                                4.404,
                                                                4.252,
                                                                4.121,
                                                                4.003,
                                                                3.889,
                                                                3.777,
                                                                3.668,
                                                                3.561,
                                                                3.456,
                                                                3.354,
                                                                3.254,
                                                                3.157,
                                                                3.062,
                                                                2.969,
                                                                2.878,
                                                                2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 29.0 mm.
    private static let e29 = EPSTransitionZoneSample(e: 29.0,
                                                     D1x: -38.5,
                                                     values: [6.867,
                                                              6.468,
                                                              6.108,
                                                              5.784,
                                                              5.491,
                                                              5.226,
                                                              4.986,
                                                              4.769,
                                                              4.575,
                                                              4.400,
                                                              4.245,
                                                              4.109,
                                                              3.990,
                                                              3.884,
                                                              3.781,
                                                              3.680,
                                                              3.582,
                                                              3.485,
                                                              3.391,
                                                              3.299,
                                                              3.209,
                                                              3.121,
                                                              3.035,
                                                              2.951,
                                                              2.870,
                                                              2.790])

    /// The points according table D.1 in EN 13715:2020 for a flange width of 28.5 mm.
    private static let e28_5 = EPSTransitionZoneSample(e: 28.5,
                                                       D1x: -39.0,
                                                       values: [6.867,
                                                                6.464,
                                                                6.104,
                                                                5.780,
                                                                5.488,
                                                                5.224,
                                                                4.985,
                                                                4.768,
                                                                4.573,
                                                                4.398,
                                                                4.241,
                                                                4.101,
                                                                3.978,
                                                                3.871,
                                                                3.776,
                                                                3.683,
                                                                3.592,
                                                                3.503,
                                                                3.417,
                                                                3.332,
                                                                3.248,
                                                                3.167,
                                                                3.088,
                                                                3.011,
                                                                2.935,
                                                                2.862,
                                                                2.790])

    /// The compete table D.1 in EN 13715:2020.
    private static let points = [28.5: e28_5,
                                 29.0: e29,
                                 29.5: e29_5,
                                 30.0: e30,
                                 30.5: e30_5,
                                 31.0: e31,
                                 31.5: e31_5,
                                 32.0: e32,
                                 32.5: e32_5]


    /// Returns the complete transition zone values from D1 to C1b for a given flange width.
    ///
    /// The points in the transition zone are mostly calculated by interpolating the columsn in
    /// table D.1 of EN 13715:2020. The first point has always the z-value of point D1, but is
    /// adjusted in its x value according to the flange width.
    ///
    /// - Parameter e: The flange width in Millimeters.
    /// - Returns: The points defining the transition zone from D1 to C1b.
    public static func values(e: Double) -> [CGPoint] {
        if let values = points[e] {
            return values.points
        } else {
            switch e {
            case 28.5..<29.0: return interpolate(e28_5, e29, e)
            case 29.0..<29.5: return interpolate(e29, e29_5, e)
            case 29.5..<30.0: return interpolate(e29_5, e30, e)
            case 30.0..<30.5: return interpolate(e30, e30_5, e)
            case 30.5..<31.0: return interpolate(e30_5, e31, e)
            case 31.0..<31.5: return interpolate(e31, e31_5, e)
            case 31.5..<32.0: return interpolate(e31_5, e32, e)
            case 32.0..<32.5: return interpolate(e32, e32_5, e)
            default: return [CGPoint]()
            }
        }
    }



    private static func interpolate(_ sample0: EPSTransitionZoneSample,
                                    _ sample1: EPSTransitionZoneSample,
                                    _ e: Double) -> [CGPoint] {
        // sample0 is the longer one
        // sampel1 is the shorter one
        var result = [CGPoint]()
        result.append(CGPoint(x: -67.5 + e, y: sample0.points[0].y))
        for index in 0..<sample1.points.count {
            let x0 = sample0.e
            let x1 = sample1.e
            let y0 = sample0.points[index+1].y
            let y1 = sample1.points[index].y

            let y = ( (x1 - e) * y0 + (e - x0) * y1 ) / (x1 - x0)

            result.append(CGPoint(x: sample1.points[index].x, y: y))
        }
        return result
    }
}


/// One column of Table D.1 in EN 13715:2020.
fileprivate struct EPSTransitionZoneSample {
    /// The x co-ordinate of the C1b point where the transition zone is ending.
    public let C1bx = -26.0

    /// The points in the table.
    public let points: [CGPoint]

    /// The flange width in Millimeters, for which this column contains the values.
    public let e: Double

    /// Creates a new ``EPSTransitionZoneSample``.
    ///
    /// - Parameters:
    ///   - e: The flange width in Millimeters.
    ///   - D1x: The x co-ordinate of the D1 point, defining the x-coordinate of the first `value`.
    ///   - values: The z-values of the
    public init(e: Double, D1x: Double, values: [Double]) {
        self.e = e
        let resolution = (C1bx - D1x)/Double(values.count-1)
        self.points = values.enumerated().map {index, y in
            CGPoint(x: D1x + Double(index) * resolution, y: y)
        }
    }
}
