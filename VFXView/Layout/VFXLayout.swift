//
//  VFXLayout.swift
//  VFXView
//
//  Created by Le Quang on 9/19/20.
//

import Foundation

struct VFXLayout {
    var animationSpeed:Double
    var particleLength:Int
    var particleRadius:Double
    
    static let vfx:VFXLayout = .init(animationSpeed: 0.03, particleLength: 30, particleRadius: 4)
}
