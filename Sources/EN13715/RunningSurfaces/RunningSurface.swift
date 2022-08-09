//
//  File.swift
//  
//
//  Created by André Rohrbeck on 08.08.22.
//

import Foundation

internal protocol RunningSurface {
    func profile(resolution: Double) -> [CGPoint]
}
