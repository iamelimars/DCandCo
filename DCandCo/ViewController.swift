//
//  ViewController.swift
//  DCandCo
//
//  Created by iMac on 7/5/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit
import Moltin
import SDWebImage

class CategorieShopViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MenuTransitionManagerDelegate {

    @IBOutlet weak var categoriesFilterView: UIView!
    let menuTransitionManager = MenuTransitionManager()
    
    var Array = [String]()
    var colorsArray = [UIColor.init(colorLiteralRed: 1, green: 216/255.0, blue: 216/255.0, alpha: 0.7),
                       UIColor.init(colorLiteralRed: 153/255.0, green: 206/255.0, blue: 212/255.0, alpha: 0.7),
                       UIColor.init(colorLiteralRed: 110/255.0, green: 115/255.0, blue: 118/255.0, alpha: 0.7),
                       UIColor.init(colorLiteralRed: 245/255.0, green: 215/255.0, blue: 110/255.0, alpha: 0.7),
                       UIColor.init(colorLiteralRed: 68/255.0, green: 0, blue: 0, alpha: 0.7),
                       UIColor.init(colorLiteralRed: 62/255.0, green: 85/255.0, blue: 155/255.0, alpha: 0.7)
                       ]
    
    var objects = [AnyObject]()
    private let PRODUCTS_LIST_SEGUE_IDENTIFIER = "productsListSegue"
    private var selectedCollectionDict:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 1, green: 216/255, blue: 216/255, alpha: 1), NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!]

        //self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Anders", size: 20)!]

        
        
        Moltin.sharedInstance().setPublicId("vjA7hGXCc7GAgvIpaYUdAzv7VYMp5HZiJkCOwwlX6K")
        
        //Make  a call to retrieve the store products
        Moltin.sharedInstance().category.listingWithParameters(nil, success: { (responseDictionary) in
            
            //Assign  products array to our objects property
            self.objects = responseDictionary["result"] as! [AnyObject]
            
            //Tell th tableView to looad its data
            self.collectionView!.reloadData()
            
            
        }) { (responseDictionary, error) in
            print("Something went wrong")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CategoriesCell
        
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.layer.borderWidth = 0.5
        
        let Button = cell.viewWithTag(1) as! UILabel
        let object = objects[indexPath.row] as! [String:AnyObject]
        Button.text = object["title"] as? String
        
        var imageUrl = ""

        if let images = object["images"] as? NSArray {
            if (images.firstObject != nil) {
                imageUrl = images.firstObject?.valueForKeyPath("url.https") as! String
            }
        }
        
        cell.imageView?.sd_setImageWithURL(NSURL(string: imageUrl))
        //cell.cellFilterView.backgroundColor = colorsArray[indexPath.row]
        //cell.cellFilterView.backgroundColor?.colorWithAlphaComponent(0.85)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width
        
        return CGSizeMake(screenWidth - 20, screenWidth)
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedCollectionDict = objects[indexPath.row] as? NSDictionary
        
        let itemselected = selectedCollectionDict!.valueForKey("id") as? String
        
        print("%@", itemselected)
        
        performSegueWithIdentifier(PRODUCTS_LIST_SEGUE_IDENTIFIER, sender: self)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == PRODUCTS_LIST_SEGUE_IDENTIFIER {
            // Set up products list view!
            let newViewController = segue.destinationViewController as! ProductsCollectionViewController
            
            newViewController.title = selectedCollectionDict!.valueForKey("title") as? String
            newViewController.collectionId = selectedCollectionDict!.valueForKeyPath("id") as? String
            
        } else {
            
            let menuTableViewControllerr = segue.destinationViewController as! menuTableViewController
            //menuTableViewController.currentItem = self.title!
            menuTableViewControllerr.transitioningDelegate = menuTransitionManager
            self.menuTransitionManager.delegate = self

            
        }
        
    }
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! menuTableViewController
        //self.title = sourceController.currentItem
    }
    

}

