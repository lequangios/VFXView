//
//  VFXView.swift
//  VFXView
//
//  Created by Le Quang on 9/19/20.
//
/*
import UIKit

public protocol VFXViewAnimatable {
    var isRepeate:Bool { get set}
    func start()
    func pause()
    func resume()
    func end()
    func stop()
    func transtion(transaction:Int)
}

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
    private var animationState:VFXAnimationState = .Initialization
    
    public var isAllowRepate:Bool = false {
        willSet {
            pause()
        }
        
        didSet {
            resume()
        }
    }
    
    var particles:[VFXParticle] = [] {
        willSet {
            pause()
        }
        
        didSet {
            resume()
        }
    }
    
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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializationView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isInitialization = true
        initializationView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if(self.isInitialization == true) {
            setupView()
            self.isInitialization = false
        }
    }
    
    func initializationView() {
        createParticle()
    }
    
    func setupView() {
        pause()
        updateParticle()
        resume()
    }
    
    public func createParticle(data:Any? = nil) {
        
    }
    
    func updateParticle() {
        
    }
    
    func startAnimation() {
        if(isAnimation == false) {
            isAnimation = true
            loop = Timer.scheduledTimer(timeInterval: animationSpeed, target: self, selector: #selector(drawView), userInfo: nil, repeats: true)
        }
    }
    
    func pauseAnimation() {
        if(isAnimation == true) {
            isAnimation = false
        }
    }
    
    func resumeAnimation() {
        isAnimation = true
    }
    
    func stopAnimation() {
        isAnimation = false
        if let timmer = loop {
            timmer.invalidate()
        }
    }
    
    @objc func drawView() {
        if(isAnimation == true) {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.beginTransparencyLayer(auxiliaryInfo: nil)
            ctx.clear(bounds);
            ctx.setFillColor(UIColor.clear.cgColor)
            ctx.fill(bounds)
            for item in particles {
                item.draw(ctx)
            }
            ctx.endTransparencyLayer()
            updateParticle()
        }
    }
    
    deinit {
        stopAnimation()
    }
}

extension VFXView : VFXViewAnimatable {
    public var isRepeate: Bool {
        get {
            return isAllowRepate
        }
        set {
            isAllowRepate = newValue
        }
    }
    
    public func start() {
        let to = animationState.doBegin()
        transtion(transaction: VFXAnimationState.trasaction(from: animationState, to: to))
        if to != animationState {  animationState = to }
    }
    
    public func pause() {
        let to = animationState.doPause()
        transtion(transaction: VFXAnimationState.trasaction(from: animationState, to: to))
        if to != animationState {  animationState = to }
    }
    
    public func resume() {
        let to = animationState.doResume()
        transtion(transaction: VFXAnimationState.trasaction(from: animationState, to: to))
        if to != animationState {  animationState = to }
    }
    
    public func end() {
        if isRepeate == true {
            resume()
        }
        else {
            stop()
        }
    }
    
    public func stop() {
        let to = animationState.doStop()
        transtion(transaction: VFXAnimationState.trasaction(from: animationState, to: to))
        if to != animationState {  animationState = to }
    }
    
    public func transtion(transaction:Int) {
        switch transaction {
        case 12:
            startAnimation()
            break
        case 23:
            pauseAnimation()
            break
        case 24:
            break
        case 25:
            stopAnimation()
            break
        case 32:
            resumeAnimation()
            break
        case 35:
            stopAnimation()
            break
        case 42:
            resumeAnimation()
            break
        case 45:
            stopAnimation()
            break
        default:
            break
        }
    }
    
}
 */
