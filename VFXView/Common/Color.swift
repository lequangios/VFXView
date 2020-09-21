//
//  Color.swift
//  VFXView
//
//  Created by Le Quang on 9/21/20.
//

import UIKit
public struct RGBA {
    var r,g,b,a:CGFloat
    var color:UIColor { return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }
    var cgColor: CGColor { self.color.cgColor }
    static let red = RGBA(r: 255, g: 0, b: 0, a: 1)
    static let blue = RGBA(r: 0, g: 0, b: 255, a: 1)
    static let green = RGBA(r: 0, g: 255, b: 0, a: 1)
    static let black = RGBA(r: 0, g: 0, b: 0, a: 1)
    static let white = RGBA(r: 255, g: 255, b: 255, a: 1)
}
