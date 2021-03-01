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
    var imageName: String!
    
    init(group: String, name: String, imageName:String){
        
        self.group = group
        self.name = name
        self.imageName = imageName
        
    }
    
    required init?(coder: NSCoder){
        
        group = (coder.decodeObject(forKey: "group") as? String) ?? ""
        name = (coder.decodeObject(forKey: "name") as? String) ?? ""
        imageName = (coder.decodeObject(forKey: "image") as? String) ?? ""
        
    }
    
    func encode(with coder: NSCoder) {
        
        coder.encode(group,forKey: "group")
        coder.encode(name,forKey: "name")
        coder.encode(imageName,forKey: "image")

    }
    
    func getImage() -> UIImage{
        
        return UIImage(named: imageName)!
        
    }
    
}
