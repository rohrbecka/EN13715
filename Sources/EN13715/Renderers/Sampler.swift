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



    /// Returns an `Array` of points on an arc between `start` and `end` including the `end` point.
    ///
    /// It is guaranteed that two neighboring points have no larger distance than `resolution`.
    /// The portion of the arc to be sampled is determined by the angle of the `start` and the `end`
    /// point in respect to the `center`.
    /// It is not checked whether `start` and `end` are located exactly on the circle defined by `center` and
    /// `radius`. Onyl the angle is used and `end` is used as the final point in the returned `Array`.
    ///
    /// - Parameters:
    ///   - start: The starting point, which will *not* be included in the returned `Array`.
    ///   - end: The end point, which will be part of the returned `Array`.
    ///   - center: The center of the arc.
    ///   - radius: The radius of the arc.
    ///   - negativeDirection: Whether the arc is drawn in mathematically negative direction.
    ///   - resolution: The maximum allowed distance between two points.
    /// - Returns: The representation of the arc as an `Array` of `CGPoints`.
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
            arcLength = arcLength + 2 * Double.pi * radius
        }
        arcLength = arcLength.truncatingRemainder(dividingBy: 2*Double.pi * radius)
        let numberOfPoints = Int (arcLength / resolution) + 1
        let result = (0..<numberOfPoints)
            .map {
                if $0 == numberOfPoints-1 {
                    return end
                }
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



    /// Returns the source `Array` of points with interpolated points, if they are necessary to match the
    /// required `resolution`.
    ///
    /// In the returned `Array` it is guaranteed that the distance between two neighboring points is not
    /// higher than `resolution`.
    /// The `source` array will not be downsampled.
    ///
    /// - Parameters:
    ///   - source: An `Array` of points to be resampled
    ///   - resolution
    /// - Returns: The  source points, possibly with additional interpolated points.
    public static func resample(_ source: [CGPoint], resolution: Double) -> [CGPoint] {
        guard source.count > 1 else {
            return [CGPoint]()
        }
        return source
            .dropLast()
            .enumerated()
            .map {index, start in
                straightLine(from: start, to: source[index+1], resolution: resolution)
            }
            .reduce([CGPoint](), +)
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


    /// Returns the ange of the given `point` in respect to the `center` point.
    ///
    /// - Parameters:
    ///   - point: The point of which to calculate the angle.
    ///   - center: The center point in respect to whcih to calculate the angle.
    /// - Returns: The angle of the `point` in respect to the `center` in radians.
    private static func angle(of point: CGPoint, inRespectTo center: CGPoint) -> Double {
        let dx = point.x - center.x
        let dy = point.y - center.y
        if dx == 0 && dy > 0 {
            return Double.pi / 2.0
        } else if dx == 0 && dy < 0 {
            return -Double.pi / 2.0
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
