//
//  PostCell.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 15.0
        postImg.clipsToBounds = true
        // Initialization code
    }
    
    func configureCell(post: Post) {
        // Set the label
        titleLabel.text = post.title
        descLabel.text = post.pDescription
        
        // 
    }

}
