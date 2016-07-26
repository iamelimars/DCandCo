//
//  animatedCircle.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/24/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit

class animatedCircle: NSObject {

    func circleAnimation (width2: CGFloat, height2: CGFloat, strokecolor: UIColor, view: UIView) {
        
        let screenWidth = view.frame.size.width
        let screenHeight = view.frame.size.height
        
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(screenWidth/2-(width2/2), screenHeight/2-(height2/2), width2, height2)
        
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
                                  radius: CGRectGetWidth(ovalRect) / 2,
                                  startAngle: ovalStartAngle,
                                  endAngle: ovalEndAngle, clockwise: true)
        
        // create an object that represents how the curve
        // should be presented on the screen
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = strokecolor.CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 0.6
        progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen
        view.layer.addSublayer(progressLine)
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
    }

    
}
