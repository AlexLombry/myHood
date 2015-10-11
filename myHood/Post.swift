//
//  Post.swift
//  myHood
//
//  Created by Alex Lombry on 10/10/15.
//  Copyright © 2015 Alex Lombry. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    // Attribut and data encapsulation
    private var _title: String!
    private var _imagePath: String!
    private var _pDescription: String!
    
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
    
    override init() {
    
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._pDescription = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._pDescription, forKey: "description")
    }
}