//
//  BodyPartsViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 8/17/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit

class BodyPartsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MenuCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuCell
        if (indexPath.row == 0) {
            cell.bodyLabel.text = "Full Body"
            cell.bodyButton.addTarget(self, action: #selector(BodyPartsViewController.pressedFull(_:)), forControlEvents: .TouchUpInside)
        } else if (indexPath.row == 1){
            cell.bodyLabel.text = "Eye"
            cell.bodyButton.addTarget(self, action: #selector(BodyPartsViewController.pressedEye(_:)), forControlEvents: .TouchUpInside)
        } else if(indexPath.row == 2) {
            cell.bodyLabel.text = "Hands"
            cell.bodyButton.addTarget(self, action: #selector(BodyPartsViewController.pressedHands(_:)), forControlEvents: .TouchUpInside)
        }else if (indexPath.row == 3){
            cell.bodyLabel.text = "Head"
            cell.bodyButton.addTarget(self, action: #selector(BodyPartsViewController.pressedHead(_:)), forControlEvents: .TouchUpInside)
        }else {
            cell.bodyLabel.text = self.appDelegate.sex == 0 ? "Female" : "Male"
            cell.bodyButton.addTarget(self, action: #selector(BodyPartsViewController.pressedToggle(_:)), forControlEvents: .TouchUpInside)
        }
        return cell
    }

    func pressedHands(sender: UIButton!) {
        self.appDelegate.bodyView = 2
        self.appDelegate.showMainPage()
    }
    func pressedFull(sender: UIButton!) {
        self.appDelegate.bodyView = 0
        self.appDelegate.showMainPage()
    }
    func pressedToggle(sender: UIButton!) {
        self.appDelegate.bodyView = 0
        if (self.appDelegate.sex == 0) {
            self.appDelegate.sex = 1
        } else {
            self.appDelegate.sex = 0
        }
    self.appDelegate.showMainPage()
    }
    func pressedHead(sender: UIButton!) {
        self.appDelegate.bodyView = 3
        self.appDelegate.showMainPage()
    }
    func pressedEye(sender: UIButton!) {
        self.appDelegate.bodyView = 1
        self.appDelegate.showMainPage()
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
