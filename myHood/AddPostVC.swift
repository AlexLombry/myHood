//
//  AddPostVC.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var postImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Corner radius for image and delete everything above
         postImage.layer.cornerRadius = postImage.frame.size.width / 2
         postImage.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
    }
    
    @IBAction func makePostBtnPressed(sender: AnyObject) {
    
    }

    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
