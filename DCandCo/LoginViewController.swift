//
//  LoginViewController.swift
//  DCandCo
//
//  Created by Elisha J Marshall III on 7/25/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var passwordText: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0

        
        self.emailText.delegate = self
        self.passwordText.delegate = self
        
        //Border for buttons
        
        loginButton.layer.borderWidth = 1.0
        signUpButton.layer.borderWidth = 1.0
        continueButton.layer.borderWidth = 1.0
        
        loginButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        loginButton.layer.cornerRadius = cornerRadius
        
        signUpButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        signUpButton.layer.cornerRadius = cornerRadius
        
        continueButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        continueButton.layer.cornerRadius = cornerRadius

    }
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        myScrollView.setContentOffset(CGPointMake(0, 250), animated: true)
    }
    @IBAction func loginButtonPressed(sender: AnyObject) {
    }
    @IBAction func signUpButtonPressed(sender: AnyObject) {
    }
    
    
    
}
