//
//  AddPostVC.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var postImage: UIImageView!
    
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Corner radius for image and delete everything above
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        // Load picker
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }
    
    // User click on the +Add Pic Button
    // We present the imgPicker view (iPhone system to show a special view to choose your picture)
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    // User click on the Make Post Button
    // We first check if we have all data : img, title, description
    
    // if so we create the path for the image and save the image itself
    // then we create an instance of Post with the 3 data
    // and we save it into userdefaults
    // We dismiss the VC to return back into the list of Post
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        
        // Let's make sure we got all data
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            
            let imgPath = DataService.singleton.saveImageAndCreatePath(img)
            let post = Post(imagePath: imgPath, title: title, description: desc)
            
            // Creating the post
            DataService.singleton.addPost(post)
            
            // Close the VC and return to main
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    // Just return to previous page
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // Automaticly call by delegate, set the image 
    // choosed by the user into postImage uiimageview
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
        
    }
}
