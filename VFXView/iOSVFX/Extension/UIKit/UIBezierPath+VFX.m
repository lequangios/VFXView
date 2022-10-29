//
//  UIBezierPath+VFX.m
//  iOSVFX
//
//  Created by Le Quang on 21/10/2022.
//

#import "UIBezierPath+VFX.h"

@implementation UIBezierPath (VFX)
+(instancetype) vfxRhombusPath {
    UIBezierPath* path00 = [UIBezierPath new];
    [path00 moveToPoint: CGPointMake(5.9, 1.2)];
    [path00 addLineToPoint:CGPointMake(0.7, 6.5)];
    [path00 addCurveToPoint:CGPointMake(0.7, 7.2) controlPoint1:CGPointMake(0.5, 6.7) controlPoint2:CGPointMake(0.5, 7.0)];
    [path00 addLineToPoint:CGPointMake(5.9, 12.6)];
    [path00 addCurveToPoint:CGPointMake(6.6, 12.6) controlPoint1:CGPointMake(6.1, 12.8) controlPoint2:CGPointMake(6.4, 12.8)];
    [path00 addLineToPoint:CGPointMake(11.8, 7.2)];
    [path00 addCurveToPoint:CGPointMake(11.8, 6.5) controlPoint1:CGPointMake(12.0, 7.0) controlPoint2:CGPointMake(12.0, 6.7)];
    [path00 addLineToPoint:CGPointMake(6.6, 1.2)];
    [path00 addCurveToPoint:CGPointMake(5.9, 1.2) controlPoint1:CGPointMake(6.4, 0.9) controlPoint2:CGPointMake(6.1, 0.9)];
    [path00 addLineToPoint:CGPointMake(5.9, 1.2)];
    [path00 closePath];
    [path00 moveToPoint: CGPointMake(3.4, 6.5)];
    [path00 addLineToPoint:CGPointMake(6.0, 3.9)];
    [path00 addCurveToPoint:CGPointMake(6.7, 3.9) controlPoint1:CGPointMake(6.2, 3.7) controlPoint2:CGPointMake(6.5, 3.7)];
    [path00 addLineToPoint:CGPointMake(9.3, 6.5)];
    [path00 addCurveToPoint:CGPointMake(9.3, 7.2) controlPoint1:CGPointMake(9.5, 6.7) controlPoint2:CGPointMake(9.5, 7.0)];
    [path00 addLineToPoint:CGPointMake(6.6, 9.9)];
    [path00 addCurveToPoint:CGPointMake(5.9, 9.9) controlPoint1:CGPointMake(6.4, 10.1) controlPoint2:CGPointMake(6.1, 10.1)];
    [path00 addLineToPoint:CGPointMake(3.4, 7.3)];
    [path00 addCurveToPoint:CGPointMake(3.4, 6.5) controlPoint1:CGPointMake(3.2, 7.1) controlPoint2:CGPointMake(3.2, 6.8)];
    [path00 addLineToPoint:CGPointMake(3.4, 6.5)];
    [path00 closePath];
    return path00;
}

+(instancetype) vfxPentahedronPath {
    UIBezierPath* path00 = [UIBezierPath new];
    [path00 moveToPoint: CGPointMake(383.4, 559.4)];
    [path00 addLineToPoint:CGPointMake(179.4, 559.4)];
    [path00 addLineToPoint:CGPointMake(176.8, 559.2)];
    [path00 addCurveToPoint:CGPointMake(68.0, 476.2) controlPoint1:CGPointMake(125.5, 554.8) controlPoint2:CGPointMake(82.8, 522.2)];
    [path00 addLineToPoint:CGPointMake(67.8, 475.6)];
    [path00 addLineToPoint:CGPointMake(6.0, 276.7)];
    [path00 addLineToPoint:CGPointMake(5.8, 276.2)];
    [path00 addCurveToPoint:CGPointMake(49.5, 144.8) controlPoint1:CGPointMake(-8.7, 226.2) controlPoint2:CGPointMake(8.9, 173.5)];
    [path00 addLineToPoint:CGPointMake(212.1, 23.0)];
    [path00 addCurveToPoint:CGPointMake(351.0, 23.0) controlPoint1:CGPointMake(252.4, -7.9) controlPoint2:CGPointMake(310.7, -7.9)];
    [path00 addLineToPoint:CGPointMake(514.5, 145.5)];
    [path00 addLineToPoint:CGPointMake(514.9, 145.8)];
    [path00 addCurveToPoint:CGPointMake(557.1, 276.1) controlPoint1:CGPointMake(553.9, 176.1) controlPoint2:CGPointMake(570.9, 228.4)];
    [path00 addLineToPoint:CGPointMake(556.8, 277.2)];
    [path00 addLineToPoint:CGPointMake(495.3, 475.2)];
    [path00 addCurveToPoint:CGPointMake(383.4, 559.4) controlPoint1:CGPointMake(480.4, 525.6) controlPoint2:CGPointMake(435.5, 559.4)];
    [path00 closePath];
    [path00 moveToPoint: CGPointMake(185.5, 439.4)];
    [path00 addLineToPoint:CGPointMake(380.7, 439.4)];
    [path00 addLineToPoint:CGPointMake(441.8, 242.6)];
    [path00 addCurveToPoint:CGPointMake(441.1, 240.5) controlPoint1:CGPointMake(441.8, 242.1) controlPoint2:CGPointMake(441.5, 241.0)];
    [path00 addLineToPoint:CGPointMake(281.5, 120.9)];
    [path00 addLineToPoint:CGPointMake(120.9, 241.2)];
    [path00 addCurveToPoint:CGPointMake(121.1, 242.4) controlPoint1:CGPointMake(120.9, 241.5) controlPoint2:CGPointMake(121.0, 241.9)];
    [path00 addLineToPoint:CGPointMake(181.9, 438.2)];
    [path00 addCurveToPoint:CGPointMake(185.5, 439.4) controlPoint1:CGPointMake(182.5, 438.5) controlPoint2:CGPointMake(183.7, 439.1)];
    [path00 closePath];
    [path00 moveToPoint: CGPointMake(441.0, 240.3)];
    [path00 addLineToPoint:CGPointMake(441.0, 240.3)];
    [path00 addLineToPoint:CGPointMake(441.0, 240.3)];
    [path00 closePath];
    return path00;
}

+(instancetype) vfxCrossPath {
    UIBezierPath* path00 = [UIBezierPath new];
    [path00 moveToPoint: CGPointMake(10.3, 4.3)];
    [path00 addLineToPoint:CGPointMake(7.7, 4.3)];
    [path00 addLineToPoint:CGPointMake(7.7, 1.7)];
    [path00 addCurveToPoint:CGPointMake(6.0, 0.0) controlPoint1:CGPointMake(7.7, 0.8) controlPoint2:CGPointMake(7.0, 0.0)];
    [path00 addCurveToPoint:CGPointMake(4.3, 1.7) controlPoint1:CGPointMake(5.0, 0.0) controlPoint2:CGPointMake(4.3, 0.8)];
    [path00 addLineToPoint:CGPointMake(4.3, 4.2)];
    [path00 addLineToPoint:CGPointMake(1.7, 4.2)];
    [path00 addCurveToPoint:CGPointMake(0.0, 6.0) controlPoint1:CGPointMake(0.8, 4.3) controlPoint2:CGPointMake(0.0, 5.0)];
    [path00 addCurveToPoint:CGPointMake(1.7, 7.7) controlPoint1:CGPointMake(0.0, 7.0) controlPoint2:CGPointMake(0.8, 7.7)];
    [path00 addLineToPoint:CGPointMake(4.2, 7.7)];
    [path00 addLineToPoint:CGPointMake(4.2, 10.2)];
    [path00 addLineToPoint:CGPointMake(4.2, 10.2)];
    [path00 addCurveToPoint:CGPointMake(6.0, 12.0) controlPoint1:CGPointMake(4.3, 11.2) controlPoint2:CGPointMake(5.0, 12.0)];
    [path00 addCurveToPoint:CGPointMake(7.7, 10.3) controlPoint1:CGPointMake(7.0, 12.0) controlPoint2:CGPointMake(7.7, 11.2)];
    [path00 addLineToPoint:CGPointMake(7.7, 7.7)];
    [path00 addLineToPoint:CGPointMake(10.2, 7.7)];
    [path00 addCurveToPoint:CGPointMake(12.0, 6.0) controlPoint1:CGPointMake(11.2, 7.7) controlPoint2:CGPointMake(12.0, 7.0)];
    [path00 addCurveToPoint:CGPointMake(10.3, 4.3) controlPoint1:CGPointMake(12.0, 5.0) controlPoint2:CGPointMake(11.2, 4.3)];
    [path00 closePath];
    return path00;
}

+(instancetype) vfxCirclePath{
    UIBezierPath* path00 = [UIBezierPath new];
    [path00 moveToPoint: CGPointMake(6.5, 0.1)];
    [path00 addCurveToPoint:CGPointMake(0.8, 6.0) controlPoint1:CGPointMake(3.4, 0.1) controlPoint2:CGPointMake(0.8, 2.8)];
    [path00 addCurveToPoint:CGPointMake(6.5, 11.9) controlPoint1:CGPointMake(0.8, 9.2) controlPoint2:CGPointMake(3.4, 11.9)];
    [path00 addCurveToPoint:CGPointMake(12.2, 6.0) controlPoint1:CGPointMake(9.6, 11.9) controlPoint2:CGPointMake(12.2, 9.2)];
    [path00 addCurveToPoint:CGPointMake(6.5, 0.1) controlPoint1:CGPointMake(12.2, 2.8) controlPoint2:CGPointMake(9.7, 0.1)];
    [path00 addLineToPoint:CGPointMake(6.5, 0.1)];
    [path00 closePath];
    [path00 moveToPoint: CGPointMake(6.5, 8.8)];
    [path00 addCurveToPoint:CGPointMake(3.8, 6.0) controlPoint1:CGPointMake(5.0, 8.8) controlPoint2:CGPointMake(3.8, 7.6)];
    [path00 addCurveToPoint:CGPointMake(6.5, 3.2) controlPoint1:CGPointMake(3.8, 4.4) controlPoint2:CGPointMake(5.0, 3.2)];
    [path00 addCurveToPoint:CGPointMake(9.2, 6.0) controlPoint1:CGPointMake(8.0, 3.2) controlPoint2:CGPointMake(9.2, 4.4)];
    [path00 addCurveToPoint:CGPointMake(6.5, 8.8) controlPoint1:CGPointMake(9.2, 7.6) controlPoint2:CGPointMake(8.0, 8.8)];
    [path00 addLineToPoint:CGPointMake(6.5, 8.8)];
    [path00 closePath];
    return path00;
}

+(instancetype) vfxPointPath{
    UIBezierPath* path00 = [UIBezierPath new];
    [path00 moveToPoint: CGPointMake(6.0, 7.5)];
    [path00 addLineToPoint:CGPointMake(6.0, 7.5)];
    [path00 addCurveToPoint:CGPointMake(4.5, 6.0) controlPoint1:CGPointMake(5.1, 7.5) controlPoint2:CGPointMake(4.5, 6.9)];
    [path00 addLineToPoint:CGPointMake(4.5, 6.0)];
    [path00 addCurveToPoint:CGPointMake(6.0, 4.5) controlPoint1:CGPointMake(4.5, 5.1) controlPoint2:CGPointMake(5.2, 4.5)];
    [path00 addLineToPoint:CGPointMake(6.0, 4.5)];
    [path00 addCurveToPoint:CGPointMake(7.5, 6.0) controlPoint1:CGPointMake(6.9, 4.5) controlPoint2:CGPointMake(7.5, 5.2)];
    [path00 addLineToPoint:CGPointMake(7.5, 6.0)];
    [path00 addCurveToPoint:CGPointMake(6.0, 7.5) controlPoint1:CGPointMake(7.5, 6.9) controlPoint2:CGPointMake(6.9, 7.5)];
    [path00 closePath];
    return path00;
}

@end
