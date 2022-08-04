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



    public static func arc(from start: CGPoint,
                           to end: CGPoint,
                           center: CGPoint,
                           radius: Double,
                           negativeDirection: Bool = false,
                           resolution: Double) -> [CGPoint] {
        let startAngleRad = angle(of: start, inRespectTo: center)
        let endAngleRad = angle(of: end, inRespectTo: center)
        var arcLength = negativeDirection
            ? (startAngleRad - endAngleRad) * radius
            : (endAngleRad - startAngleRad) * radius
        if arcLength < 0 {
            arcLength = arcLength + 2 * Double.pi
        }
        arcLength = arcLength.truncatingRemainder(dividingBy: 360.0)
        let numberOfPoints = Int (arcLength / resolution) + 1
        let result = (0..<numberOfPoints)
            .map {
                let angle: Double
                if negativeDirection {
                    angle = endAngleRad + Double(numberOfPoints - $0 - 1) * resolution / radius
                } else {
                    angle = endAngleRad - Double(numberOfPoints - $0 - 1) * resolution / radius
                }
                return CGPoint(x: center.x + cos(angle) * radius,
                               y: center.y + sin(angle) * radius)
            }

        if
            let first = result.first,
            distance(from: first, to: start) < 0.000000001 {
            return Array(result.dropFirst())
        }
        return result
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



    private static func angle(of point: CGPoint, inRespectTo center: CGPoint) -> Double {
        let dx = point.x - center.x
        let dy = point.y - center.y
        if dx == 0 && dy > 0 {
            return Double.pi / 2.0
        } else if dx == 0 && dy < 0 {
            return Double.pi / 2.0
        } else {
            let angle = atan(dy / dx)
            if dx > 0 {
                return angle
            } else{
                return angle + Double.pi
            }
        }
    }
}



extension CGPoint: Equatable {
    /// Returns `true` if the two points are at the same position.
    public static func ==(lhs: CGPoint, rhs: CGPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}
