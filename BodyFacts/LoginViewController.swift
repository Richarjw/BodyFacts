//
//  LoginViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    var segueToSignUp = "loginToRegister"
    
    
    @IBOutlet weak var txtUsername: UITextField! //Email Really
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func signinButton(sender: AnyObject) {
        //Use Firebase to check if a verified login.
        FIRAuth.auth()?.signInWithEmail(txtUsername.text!, password: txtPassword.text!, completion: loginCompletionCallback)
    }
    @IBAction func signUpButton(sender: AnyObject) {
        self.performSegueWithIdentifier(self.segueToSignUp, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func loginCompletionCallback(user: FIRUser?, error: NSError?) {
        if error == nil {
            self.appDelegate.handleLogin()
        } else {
            let alertController = UIAlertController(title: "Login Failure", message: "Email and Password do not match", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(ok)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
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
