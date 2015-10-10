//
//  Post.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import Foundation

class Post {
    
    // Attribut and data encapsulation
    private var _title: String
    private var _imagePath: String
    private var _pDescription: String
    
    var title: String {
        return _title
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var pDescription: String {
        return _pDescription
    }
    
    // initializer (constructor)
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._pDescription = description
    }
}