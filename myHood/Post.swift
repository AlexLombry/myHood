//
//  Post.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import Foundation

class Post {
    private var title: String
    private var imagePath: String
    private var pDescription: String
    
    init(imagePath: String, title: String, description: String) {
        self.imagePath = imagePath
        self.title = title
        self.pDescription = description
    }
}