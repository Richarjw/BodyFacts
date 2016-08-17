//
//  BodyViewController.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import SceneKit
import Firebase
class BodyViewController: UIViewController {

    @IBOutlet weak var scnView: SCNView!
    
    
    @IBOutlet weak var informationButton: UIBarButtonItem!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var currentEvent : Event?
    var showDetailSegueIdentifier = "ShowDetailViewControllerSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scnView.backgroundColor = UIColor.blackColor()
        if (self.appDelegate.bodyView == 0) {
            if (self.appDelegate.sex == 0) {
            self.scnView.scene = SCNScene(named: "standard-male-figure.dae")
            } else {
                self.scnView.scene = SCNScene(named: "standard-female-figure.dae")
            }
            self.currentEvent?.bodyPart = "Full Body"
        } else if (self.appDelegate.bodyView == 1) {
            self.scnView.scene = SCNScene(named: "eyeball.dae")
            self.currentEvent?.bodyPart = "Eyes"

        } else if (self.appDelegate.bodyView == 2){
            self.scnView.scene = SCNScene(named: "hands.dae")
            self.currentEvent?.bodyPart = "Hands"
        } else if (self.appDelegate.bodyView == 3) {
            self.scnView.scene = SCNScene(named: "skull.dae")
            self.currentEvent?.bodyPart = "Head"
        }
        self.currentEvent?.date = " "
        self.currentEvent?.title = " "
        self.currentEvent?.details = " "

        self.scnView.autoenablesDefaultLighting = true
        self.scnView.allowsCameraControl = true
        
        self.view.reloadInputViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedBody(sender: AnyObject) {
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())


    }
    

    
    @IBAction func pressedInfo(sender: AnyObject) {
        performSegueWithIdentifier(showDetailSegueIdentifier, sender: self)
    }

    @IBAction func pressedReturn(sender: AnyObject) {
        self.appDelegate.handleLogin()
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == showDetailSegueIdentifier {
             (segue.destinationViewController as! EventDetailViewController).currentEvent = currentEvent
            }
        }

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


