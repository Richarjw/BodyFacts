//
//  SignUpViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWordA: UITextField!
    @IBOutlet weak var passWordB: UITextField!
    
    
    
    
    @IBAction func registerButton(sender: AnyObject) {
        let validEmail : String = email.text! as String
        let username: String = userName.text! as String
        let password: String = passWordA.text! as String
        let confirmPassword : String = passWordB.text! as String
        
        if (username == "" || password == "") {
            let alertController = UIAlertController(title: "Invalid Inputs", message: "Enter A Username and password", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(ok)
            presentViewController(alertController, animated: true, completion: nil)

        } else if (password != confirmPassword) {
            let alertController = UIAlertController(title: "Invalid Inputs", message: "Passwords do not match", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(ok)
            presentViewController(alertController, animated: true, completion: nil)

        } else {
            FIRAuth.auth()?.createUserWithEmail(validEmail, password: password, completion: signUpCompletionCallback)
        }
    }
    func signUpCompletionCallback(user: FIRUser?, error: NSError?) {
        if error == nil {
            self.appDelegate.handleLogin()
        } else {
            let alertController = UIAlertController(title: "Invalid Inputs", message: "Enter A Username and password", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(ok)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func loginScreenButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
