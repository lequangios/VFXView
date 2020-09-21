//
//  VFXSnowView.swift
//  VFXView
//
//  Created by Le Quang on 9/19/20.
//

import UIKit

struct VFXSnowViewParticle {
    var x,y,r,d:CGFloat
    private var i:Int
    private var color:RGBA
}

extension VFXSnowViewParticle : VFXParticle {
    typealias RawDataType = (radius:CGFloat, color : RGBA)
    static let raw:RawDataType = (1.0, RGBA.white)
    
    var index: Int {
        get {
            return i
        }
        set {
            i = newValue
        }
    }
    
    mutating func update(_ rect: CGRect, _ value: Any) {
        let angle = value as? CGFloat ?? 0.01
        let width = rect.width
        let height = rect.height
        x += sin(angle) * 2.0
        y += cos(angle + d) + 1.0 + r/2.0
        if(x > width + 5 || x < -5 || y > height) {
            if(i % 3 > 0) { //66.67% of the flakes
                x = CGFloat.rand * width
                y = -10
            }
            else {
                //If the flake is exitting from the right
                if(sin(angle) > 0) {
                    //Enter from the left
                    x = -5
                    y = CGFloat.rand * height
                }
                else {
                    //If the flake is exitting from the right
                    x = width + 5
                    y = CGFloat.rand * height
                }
            }
        }
    }
    
    static func particles(_ length: Int, _ rect: CGRect, _ value: Any) -> [VFXParticle] {
        var list:[VFXParticle] = []
        for i in 0...length {
            let data = value as? RawDataType ?? (1.0, RGBA.white)

            let x = rect.size.width * CGFloat.rand
            let y = rect.size.height * CGFloat.rand
            let r = data.radius * CGFloat.rand + 1
            let d = CGFloat(length) * CGFloat.rand
            let item = VFXSnowViewParticle(x: x, y: y, r: r, d: d, i:i, color: data.color)
            list.append(item)
        }
        return list
    }
    
    func draw(_ ctx:CGContext){
        ctx.setFillColor(color.cgColor)
        ctx.beginPath()
        ctx.addArc(center: CGPoint(x: x, y: y), radius: r, startAngle: 0, endAngle: CGFloat(2.0 * Double.pi), clockwise: true)
        ctx.closePath()
        ctx.fillPath()
    }
}

public class VFXSnowView: VFXView {
    private var angle:CGFloat = 0.0
    
    public var snowRadius:CGFloat = 1.0 {
        didSet {
            createParticle()
        }
    }
    
    public var snowCount:Int = 30 {
        didSet {
            createParticle()
        }
    }
    
    public var snowColor:RGBA = RGBA(r: 255, g: 255, b: 255, a: 0.5) {
        didSet {
            createParticle()
        }
    }
    
    public override func createParticle(data: Any? = nil) {
        let value:VFXSnowViewParticle.RawDataType = (snowRadius, snowColor)
        particles = VFXSnowViewParticle.particles(snowCount, bounds, value)
    }
    
    override func updateParticle() {
        var newParticles = [VFXParticle]()
        angle += 0.01
        for var item in particles {
            item.update(bounds, angle)
            newParticles.append(item)
        }
        particles = newParticles
    }
}
