//
//  ViewController.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataService.singleton.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Create a new cell for each data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let post = posts[indexPath.row]
        
        let post = DataService.singleton.loadedPosts[indexPath.row]
        
        // The cell is really PostCell View
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            // Grab the post
            cell.configureCell(post)
            return cell
        } else {
            // If we dont have the cell, make a new one
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    // Wants to know the height of our cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85.0
    }
    
    // how many rows are we gonna show
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.singleton.loadedPosts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }

}

