//
//  Sampler.swift
//  
//
//  Created by André Rohrbeck on 04.08.22.
//

import Foundation

internal enum Sampler {

    /// Returns an Array of points on a straight line from `start` to `end` without the `start` point, but including the `end`.
    ///
    /// The array is returned without `start`, but including `end` and the guarantee, that no two neighboring points have a larger
    /// distance than `resolution`. This includes the distance from `start` to the first element of the result array.
    ///
    /// - Parameters:
    ///   - start: The starting point, which will *not* be included in the returned `Array`.
    ///   - end: The end point, which will be part of the returned `Array`.
    ///   - resolution: The maximum allowed distance between two points.
    ///
    /// - Returns: An array of ``CGPoint``s, representing the straight line from `start` to `end`-
    public static func straightLine(from start: CGPoint, to end: CGPoint, resolution: Double) -> [CGPoint] {
        let lengthOfLine = distance(from: start, to: end)
        let numberOfPoints =  Int(lengthOfLine / resolution) + 1
        let resolutionX = (end.x - start.x) / lengthOfLine * resolution
        let resolutionY = (end.y - start.y) / lengthOfLine * resolution
        let result: [CGPoint] = (0..<numberOfPoints)
            .map {CGPoint(x: end.x - Double(numberOfPoints - $0 - 1) * resolutionX,
                          y: end.y - Double(numberOfPoints - $0 - 1) * resolutionY)}
        if result.first == start {
            return Array(result.dropFirst())
        }
        return result
    }



    public static func arc(from start: CGPoint, to end: CGPoint, center: CGPoint, radius: Double, resolution: Double) -> [CGPoint] {
        [CGPoint]()
    }


    /// Calculates the distance betweem two ``CGPoint``s assuming a cartesian co-ordinate system.
    ///
    /// - Parameter p0: The first point.
    /// - Parameter p1: The second point.
    /// - Returns The distance.
    private static func distance(from p0: CGPoint, to p1: CGPoint) -> Double {
        let xDist = p1.x - p0.x
        let yDist = p1.y - p0.y
        return sqrt(yDist*yDist + xDist*xDist)
    }
}



extension CGPoint: Equatable {
    /// Returns `true` if the two points are at the same position.
    public static func ==(lhs: CGPoint, rhs: CGPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}
