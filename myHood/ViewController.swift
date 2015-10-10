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
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Say to tb we are the delegate
        // Already did on the Main Storyboard
        
        // tableView.delegate = self
        // tableView.dataSource = self
        
        var post1 = Post(imagePath: "", title: "Post 1", description: "Description qui ne sert à rien")
        var post2 = Post(imagePath: "", title: "Post 2", description: "Encore un autre message à afficher")
        var post3 = Post(imagePath: "", title: "Post 3", description: "Troisième message à afficher")
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        
        // When you put information into a tableView you have to reload it
        tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Create a new cell for each data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
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
        return posts.count
    }
    


}

