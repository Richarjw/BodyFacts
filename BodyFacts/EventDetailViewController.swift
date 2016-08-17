//
//  EventDetailViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 8/17/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import Firebase
class EventDetailViewController: UIViewController {

    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var dateTitle: UILabel!
    
    @IBOutlet weak var bodyPart: UILabel!
    
    @IBOutlet weak var details: UITextView!
    
    
    var currentEvent : Event?
    
    var eventRef : FIRDatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.reload()
    }
    func reload() {
        eventTitle.text = currentEvent?.title
        dateTitle.text = currentEvent?.date
        bodyPart.text = currentEvent?.bodyPart
        details.text = currentEvent?.details
    }

    @IBAction func pressedMenu(sender: AnyObject) {
        let alert = UIAlertController(title: "Menu", message: nil, preferredStyle: .ActionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let edit = UIAlertAction(title: "Edit Event", style: .Default) { (UIAlertAction) in
            self.editEvent()
        }
        let ret = UIAlertAction(title: "Return", style: .Default) { (UIAlertAction) in
            self.appDelegate.showMainPage()
        }
        
        alert.addAction(edit)
        alert.addAction(ret)
        alert.addAction(cancel)
        presentViewController(alert, animated: true, completion: nil)

    }
    func editEvent() {
        let alert = UIAlertController(title: "Edit Event", message: "Do not leave anything blank.", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.textFields![0].text = self.eventTitle.text
        alert.textFields![1].text = self.dateTitle.text
        alert.textFields![2].text = self.bodyPart.text
        alert.textFields![3].text = self.details.text
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let commit = UIAlertAction(title: "Commit", style: .Default) {
            (UIAlertAction) in
            let newEvent = Event(title: alert.textFields![0].text, date: alert.textFields![1].text, bodyPart: alert.textFields![2].text, details: alert.textFields![3].text)
            self.currentEvent = newEvent
            self.reload()
            
        }
        alert.addAction(commit)
        alert.addAction(cancel)
        presentViewController(alert, animated: true, completion: nil)
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
