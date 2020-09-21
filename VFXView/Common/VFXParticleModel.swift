//
//  VFXParticleModel.swift
//  VFXView
//
//  Created by Le Quang on 9/21/20.
//

import UIKit

public enum VFXAnimationState:Int {
    case Initialization = 1
    case AnimationStarted = 2
    case AnimationPaused = 3
    case AnimationEnded = 4
    case AnimationStoped = 5
    
    static func allTransaction() -> [Int] {
        return [12, 23, 24, 25, 32, 35, 42, 45]
    }
    
    static func trasaction(from:VFXAnimationState, to:VFXAnimationState) -> Int {
        return from.rawValue * 10 + to.rawValue
    }
    
    func doBegin() -> VFXAnimationState {
        switch self {
        case .Initialization:
            return .AnimationStarted
        default:
            return self
        }
    }
    
    func doPause() -> VFXAnimationState {
        switch self {
        case .AnimationStarted:
            return .AnimationPaused
        default:
            return self
        }
    }
    
    func doStop() -> VFXAnimationState {
        switch self {
        case .AnimationStarted, .AnimationPaused, .AnimationEnded:
            return .AnimationStoped
        default:
            return self
        }
    }
    
    func doResume() -> VFXAnimationState {
        switch self {
        case .AnimationEnded, .AnimationPaused:
            return .AnimationStarted
        default:
            return self
        }
    }
    
    func doDone() -> VFXAnimationState {
        switch self {
        case .AnimationStarted:
            return .AnimationEnded
        default:
            return self
        }
    }
}

public protocol VFXParticle {
    var index:Int {get set}
    func draw(_ ctx:CGContext)
    mutating func update(_ rect:CGRect, _ value:Any)
    static func particles(_ length:Int, _ rect:CGRect, _ value:Any) -> [VFXParticle]
}
