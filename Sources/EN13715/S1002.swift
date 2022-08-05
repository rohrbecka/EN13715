//
//  S1002.swift
//  
//
//  Created by André Rohrbeck on 05.08.22.
//

import Foundation


struct S1002 {
    /// The z values of the area between D1 and T1 (both included) with a sampling rate of 0.5 mm.
    ///
    /// The first y-co-ordinate is the one of D1.
    private static let D1T1ZCoordinates: [Double] =
        [6.867, // D1
         6.432,
         6.038,
         5.681,
         5.357,
         5.062,
         4.793,
         4.547,
         4.321,
         4.114,
         3.922,
         3.743,
         3.576,
         3.419,
         3.270,
         3.129,
         2.994,
         2.865,
         2.741, // C1
         2.623,
         2.509,
         2.401,
         2.297,
         2.197,
         2.101,
         2.008,
         1.920,
         1.834,
         1.752,
         1.673,
         1.597,
         1.523,
         1.452,
         1.384,
         1.318,
         1.254,
         1.193,
         1.134,
         1.076,
         1.021,
         0.967,
         0.916,
         0.866,
         0.818,
         0.771,
         0.726,
         0.682,
         0.640,
         0.600,
         0.561,
         0.523,
         0.486,
         0.451,
         0.417,
         0.384,
         0.352,
         0.322,
         0.292,
         0.264,
         0.237,
         0.211,
         0.185,
         0.161,
         0.138,
         0.116,
         0.094,
         0.074,
         0.054,
         0.035,
         0.017]     // T1


    /// The z values of the area between D0 and B1 (D0 included, B1 not included) with a sampling rate of 0.5 mm.
    /// The first y-co-ordinate is 0.0 mm (D0).
    private static let D0B1ZCoordinates: [Double] =
        [0.000,
         -0.016,
         -0.032,
         -0.047,
         -0.061,
         -0.075,
         -0.087,
         -0.100,
         -0.111,
         -0.122,
         -0.132,
         -0.142,
         -0.151,
         -0.160,
         -0.168,
         -0.176,
         -0.183,
         -0.190,
         -0.196,
         -0.203,
         -0.208,
         -0.214,
         -0.219,
         -0.224,
         -0.229,
         -0.234,
         -0.238,
         -0.242,
         -0.247,
         -0.251,
         -0.256,
         -0.260,
         -0.265,
         -0.269,
         -0.274,
         -0.280,
         -0.285,
         -0.291,
         -0.298,
         -0.304,
         -0.312,
         -0.320,
         -0.328,
         -0.338,
         -0.348,
         -0.358,
         -0.370,
         -0.382,
         -0.396,
         -0.410,
         -0.426,
         -0.443,
         -0.460,
         -0.479,
         -0.499,
         -0.521,
         -0.543,
         -0.567,
         -0.592,
         -0.619,
         -0.646,
         -0.675,
         -0.705,
         -0.737,
         -0.769]    // y = 32.0 mm

    let D0 = CGPoint(x: 0, y: 0)

    let B1 = CGPoint(x: 32.158, y: -0.780)

    let e: Double

    let slopePercent: Double

    let wheelWidth: Double

    /// The points between ``D1`` (not included) and ``T1`` (included).
    let D1T1: [CGPoint]

    /// The points between ``D0`` (not included) and ``B1`` (included).
    let D0B1: [CGPoint]

    /// The point ``T1``.
    let T1: CGPoint


    let A1: CGPoint

    let I: CGPoint

    init(e: Double, slopePercent: Double, wheelWidth: Double) {
        self.e = e
        self.slopePercent = slopePercent
        self.wheelWidth = wheelWidth
        let D1 = Flange(e: e, h: 30.0).D1 // 30.0 just as dummy value, TODO: Think on calculating functions.
        self.D1T1 = Array(S1002.D1T1ZCoordinates.enumerated().map {(index, y) in
            return CGPoint(x: D1.x + Double(index) * 0.5, y: y)
        }.dropFirst())
        self.D0B1 = Array(S1002.D0B1ZCoordinates.enumerated().map {(index, y) in
            CGPoint(x: Double(index) * 0.5, y: y)
        })
        self.T1 = self.D1T1.last ?? D0
        self.A1 = CGPoint(x: wheelWidth - 70.0 - 5.0, y: B1.y - slopePercent/100.0 * (wheelWidth - 110.0)) // TODO: double code
        self.I = CGPoint(x: wheelWidth - 70.0, y: A1.y - 5.0) // TODO: double code
    }
}



extension S1002 {
    internal func profile(resolution: Double) -> [CGPoint] {
        transitionZone(resolution: resolution)
        + T1D0(resolution: resolution)
        + outerRunningSurface(resolution: resolution)
        + slope(resolution: resolution)
        + chamfer(resolution: resolution)
        + wheelFront(resolution: resolution)
    }


    private func transitionZone(resolution: Double) -> [CGPoint] {
        Sampler.resample(D1T1, resolution: resolution)
    }


    private func T1D0(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: T1, to: D0, resolution: resolution)
    }


    private func outerRunningSurface(resolution: Double) -> [CGPoint] {
        Sampler.resample(D0B1, resolution: resolution)
    }


    private func slope(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: B1, to: A1, resolution: resolution) // TODO: near double code, but B1 instead of B1a)
    }



    private func chamfer(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: A1, to: I, resolution: resolution) // TODO: double code with OneTo40
    }



    private func wheelFront(resolution: Double) -> [CGPoint] {
        Sampler.straightLine(from: I, to: CGPoint(x: I.x, y: I.y-10), resolution: resolution) // TODO: double code with OneTo40
    }
}
