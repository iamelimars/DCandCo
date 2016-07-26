//
//  CartViewController.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/10/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuItems = ["Categories", "Cart", "All Products", "My Account", "About Me"]
    var currentItem = "Categories"

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) 
        //OstrichSansRounded-Medium
        //HelveticaNeue-Light
        cell.userInteractionEnabled = true
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.font = UIFont(name: "OstrichSans-Medium", size: 20)
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        cell.backgroundColor = UIColor.init(colorLiteralRed: 255/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        print("selected")
        print("%@", indexPath.row)
        if (indexPath.row == 2) {
            print("toAllProducts")
            [self .performSegueWithIdentifier("toAllProducts", sender: self)]
        }
    }
    
}
