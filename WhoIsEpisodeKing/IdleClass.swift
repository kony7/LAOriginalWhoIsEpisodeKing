//
//  IdleClass.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class idle: NSObject, NSCoding{
    
    var group: String!
    var name: String!
//    var image: NSData!
    
    init(group: String, name: String){
        
        self.group = group
        self.name = name
//        self.image = image
        
    }
    
    required init?(coder: NSCoder){
        
        group = (coder.decodeObject(forKey: "group") as? String) ?? ""
        name = (coder.decodeObject(forKey: "name") as? String) ?? ""
//        image = (coder.decodeObject(forKey: "image") as? NSData)
        
    }
    
    func encode(with coder: NSCoder) {
        
        coder.encode(group,forKey: "group")
        coder.encode(name,forKey: "name")
//        coder.encode(image,forKey: "image")

    }
    
}
