//
//  menuTableViewController.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/26/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit

class menuTableViewController: UITableViewController {
    
    var menuItems = ["Categories", "Cart", "All Products", "My Account", "About Me"]

    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath)
        //OstrichSansRounded-Medium
        //HelveticaNeue-Light
        cell.userInteractionEnabled = true
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.font = UIFont(name: "OstrichSans-Medium", size: 20)
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        cell.backgroundColor = UIColor.init(colorLiteralRed: 255/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1)
        
        return cell
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("pressed")
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if (indexPath.row == 2) {
            print("2")
            performSegueWithIdentifier("toAllProducts", sender: self)
        }

        
    }

}
