//
//  tabBarVontroller.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/26/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit

class tabBarVontroller: UITabBarController, MenuTransitionManagerDelegate {
    let menuTransitionManager = MenuTransitionManager()

    override func viewDidLoad() {
        
        
    }
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        
            
        let menuTableViewControllerr = segue.destinationViewController as! menuTableViewController
        //menuTableViewController.currentItem = self.title!
        menuTableViewControllerr.transitioningDelegate = menuTransitionManager
        self.menuTransitionManager.delegate = self
            
            
        
        
    }

    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! menuTableViewController
        //self.title = sourceController.currentItem
    }
}
