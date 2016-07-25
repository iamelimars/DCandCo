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
        
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.blackColor()
        
        return cell
        
    }
    
}
