//
//  HomeViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var homeToLoginSegue = "homeToLogin"
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var currentUser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if (FIRAuth.auth()?.currentUser == nil)  {
            self.performSegueWithIdentifier(self.homeToLoginSegue, sender: self)
        } else {
            self.currentUser.text = prefs.valueForKey("USERNAME") as? String
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        currentUser.text = FIRAuth.auth()?.currentUser?.email
        self
    }
    
 
    @IBAction func logoutButton(sender: AnyObject) {
        self.appDelegate.handleLogout()
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
