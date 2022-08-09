//
//  InvalidRangeError.swift
//  
//
//  Created by André Rohrbeck on 08.08.22.
//

import Foundation

/// An ``Error`` describing, that a parameter is outside its valid range.
public enum InvalidRangeError: Error {
    /// The flange height was out of the valid range.
    case h

    /// The flange width was out of the valid range.
    case e

    /// The gradient of the outer running surface was out of the valid range.
    case slope
}
