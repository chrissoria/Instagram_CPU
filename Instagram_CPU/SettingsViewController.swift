//
//  SettingsViewController.swift
//  Instagram_CPU
//
//  Created by christopher soria on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        
        self.dismissViewControllerAnimated(false, completion: nil)
        print("bye!")
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
