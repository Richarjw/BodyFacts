//
//  MenuViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import CoreData
import Firebase
class MenuViewController: UITableViewController {


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MenuCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuCell
        if (indexPath.row == 0) {
            cell.cellLabel.text = "Main Page"
            cell.cellButton.addTarget(self, action: #selector(MenuViewController.pressedMain(_:)), forControlEvents: .TouchUpInside)
        } else if (indexPath.row == 1) {
            cell.cellLabel.text = "Logout"
            cell.cellButton.addTarget(self, action: #selector(MenuViewController.pressedLogout(_:)), forControlEvents: .TouchUpInside)
        }else if (indexPath.row == 2){
            cell.cellLabel.text = "Update Settings"
            cell.cellButton.addTarget(self, action: #selector(MenuViewController.pressedInfo(_:)), forControlEvents: .TouchUpInside)
        }else {
            cell.cellLabel.text = "Reset Password"
            cell.cellButton.addTarget(self, action: #selector(MenuViewController.pressedChangePassword(_:)), forControlEvents: .TouchUpInside)
        }
        return cell
    }
    func pressedInfo(sender: UIButton!) {
        let alert = UIAlertController(title: "Personal Information", message: "Enter the Following Information", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (UITextField) in
            print("Text 1")
        }
        alert.addTextFieldWithConfigurationHandler { (UITextField) in
            print("Text 2")
        }
        alert.addTextFieldWithConfigurationHandler { (UITextField) in
            print("Text 3")
        }
        let ok = UIAlertAction(title: "Okay", style: .Default) {(Void) in
            print("DO SOMETHING")
            
        }
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func pressedMain(sender: UIButton!) {
        self.appDelegate.showMainPage()
    }
    func pressedLogout(sender: UIButton!) {
        self.appDelegate.handleLogout()
    }
    func pressedChangePassword(sender:UIButton!) {
        let alert = UIAlertController(title: "Change Password", message: "Please Enter Current Email then New Password", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler(nil)
        let okay = UIAlertAction(title: "Done", style: .Default) { (UIAlertAction) in
            print(FIRAuth.auth()?.currentUser!.email)
            print(alert.textFields![1].text)
            if(FIRAuth.auth()?.currentUser!.email == alert.textFields![0].text && alert.textFields![1].text != "") {
                FIRAuth.auth()?.currentUser?.updatePassword(alert.textFields![1].text!, completion: nil)
            } else {
                print("Could not complete password change, Try Again.")
            }
        }
        alert.addAction(okay)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    func passwordChangeEmail() {
        
    }
}
