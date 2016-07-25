//
//  animationViewController.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/24/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit

class animationViewController: UIViewController {

    override func viewDidLoad() {
        
        let introCircle = animatedCircle()
        introCircle.circleAnimation(200, height2: 200, strokecolor: UIColor.lightGrayColor(), view: self.view)
        [self .performSelector(#selector(animationViewController.leaveAnimation), withObject: nil, afterDelay: 4.0)]
    }
    
    func leaveAnimation() {
        self.performSegueWithIdentifier("animationFinished", sender: self)
    }
}
