//
//  InstagramViewController.swift
//  Instagram_CPU
//
//  Created by christopher soria on 3/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var logoutBarButton: UIBarButtonItem!
    
    var photos: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        parseAPICall()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoTableViewCell
        let photo = photos[indexPath.row]
        cell.photoView.file = photo["media"] as? PFFile
        cell.photoView.loadInBackground()
        
        
        
        //2-setting the caption
        let caption = photo ["caption"] as! String
        cell.captionLabel.text = caption
        print("getting caption")
        
        return cell
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        
        self.dismissViewControllerAnimated(false, completion: nil)
        print("bye!")
    
    }
    
    func parseAPICall() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                print("data fetched")
                self.photos = posts
                self.tableView.reloadData()
            } else {
                // handle error
                print ("Error")
            }
        }
    }
    
    



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
