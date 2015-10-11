//
//  DataService.swift
//  myHood
//
//  Created by Alex Lombry on 11/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    // only make one instance of DS
    static let singleton = DataService()
    
    let KEY_POST = "posts"

    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        // all array of post converted into data (stored in disk)
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        
        // Put all data for key in standard user defaults
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POST)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        // Get all data
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
            // reversed archived data
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        // Set a notification to know posts has been loaded
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        // create a representation of data stored in udefault
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name: String) -> String {
        // Get the application documents path (personal one)
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // get the first element
        let fullPath = paths[0] as NSString
        
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}