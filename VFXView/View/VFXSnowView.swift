//
//  VFXSnowView.swift
//  VFXView
//
//  Created by Le Quang on 9/19/20.
//

import UIKit

struct VFXSnowViewParticle {
    var x,y,r,d:CGFloat
    mutating func refresh(_ length:Int, _ size:CGSize, _ radius:CGFloat) {
        self.x = size.width * CGFloat.random(in: 0...1)
        self.y = size.height * CGFloat.random(in: 0...1)
        self.r = radius * CGFloat.random(in: 0...1) + 1
        self.d = CGFloat(length) * CGFloat.random(in: 0...1)
    }
    
    func draw(_ ctx:CGContext){
        ctx.beginPath()
        ctx.addArc(center: CGPoint(x: x, y: y), radius: r, startAngle: 0, endAngle: CGFloat(2.0 * Double.pi), clockwise: true)
        ctx.closePath()
        ctx.fillPath()
    }
    
    static func makeParticles(_ length:Int, _ size:CGSize, _ radius:CGFloat) -> [VFXSnowViewParticle] {
        var list:[VFXSnowViewParticle] = []
        for _ in 0...length {
            let x = size.width * CGFloat.random(in: 0...1)
            let y = size.height * CGFloat.random(in: 0...1)
            let r = radius * CGFloat.random(in: 0...1) + 1
            let d = CGFloat(length) * CGFloat.random(in: 0...1)
            let item = VFXSnowViewParticle(x: x, y: y, r: r, d: d)
            list.append(item)
        }
        return list
    }
}

public class VFXSnowView: VFXView {
    private var particles:[VFXSnowViewParticle] = []
    private var angle:CGFloat = 0.0
    
    public var particleColor:UIColor = .white {
        didSet {
            if(self.isAnimation == true) {
                stopAnimation()
                startAnimation()
            }
        }
    }
    
    override func setupView() {
        particles = VFXSnowViewParticle.makeParticles(particleLength, CGSize(width: width, height: height), CGFloat(particleRadius))
    }
    
    override func updateParticle() {
        angle += 0.01
        var i:Int = 0
        var newParticles = [VFXSnowViewParticle]()
        for var item in particles {
            item.x += sin(angle) * 2.0
            item.y += cos(angle + item.d) + 1.0 + item.r/2.0
            if(item.x > width + 5 || item.x < -5 || item.y > height) {
                if(i % 3 > 0) { //66.67% of the flakes
                    item.x = CGFloat.random(in: 0...1) * width
                    item.y = -10
                }
                else {
                    //If the flake is exitting from the right
                    if(sin(angle) > 0) {
                        //Enter from the left
                        item.x = -5
                        item.y = CGFloat.random(in: 0...1) * height
                    }
                    else {
                        //If the flake is exitting from the right
                        item.x = width + 5
                        item.y = CGFloat.random(in: 0...1) * height
                    }
                }
            }
            newParticles.append(item)
            i = i + 1
        }
        particles = newParticles
    }
    
    open override func draw(_ rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.beginTransparencyLayer(auxiliaryInfo: nil)
            ctx.clear(bounds);
            ctx.setFillColor(UIColor.clear.cgColor)
            ctx.fill(bounds)
            ctx.setFillColor(particleColor.cgColor);
            for item in particles {
                item.draw(ctx)
            }
            ctx.endTransparencyLayer()
            updateParticle()
        }
    }
}
