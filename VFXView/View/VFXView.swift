//
//  VFXView.swift
//  VFXView
//
//  Created by Le Quang on 9/19/20.
//

import UIKit

public class VFXView: UIView {
    var x:CGFloat {
        get { return frame.origin.x }
        set {
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            setupView()
        }
    }
    
    var y:CGFloat {
        get { return frame.origin.y }
        set {
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height)
            setupView()
        }
    }
    
    var width:CGFloat {
        get { return frame.size.width }
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.size.height)
            setupView()
        }
    }
    
    var height:CGFloat {
        get { return frame.size.height }
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: newValue)
            setupView()
        }
    }
    
    private(set) var isAnimation:Bool = false
    private var isInitialization:Bool = false
    private var loop:Timer?
    
    public var particleLength:Int = VFXLayout.vfx.particleLength {
        didSet{
            setupView()
        }
    }
    
    public var animationSpeed:Double = VFXLayout.vfx.animationSpeed {
        didSet{
            if(self.isAnimation == true) {
                stopAnimation()
                startAnimation()
            }
        }
    }
    
    var particleRadius:Double = VFXLayout.vfx.particleRadius {
        didSet{
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isInitialization = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if(self.isInitialization == true) {
            setupView()
            self.isInitialization = false
        }
    }
    
    func initializationView() {
        
    }
    
    func setupView() {
        let resume = self.isAnimation
        if(self.isAnimation == true) { stopAnimation() }
        updateParticle()
        if (resume == true) { startAnimation() }
    }
    
    func updateParticle() {
        
    }
    
    public func startAnimation() {
        if(isAnimation == false) {
            isAnimation = true
            loop = Timer.scheduledTimer(timeInterval: animationSpeed, target: self, selector: #selector(drawView), userInfo: nil, repeats: true)
        }
    }
    
    public func stopAnimation() {
        isAnimation = false
        if let timmer = loop {
            timmer.invalidate()
        }
    }
    
    @objc func drawView() {
        if(isAnimation == true) { setNeedsDisplay() }
    }
    
    deinit {
        stopAnimation()
    }
}
