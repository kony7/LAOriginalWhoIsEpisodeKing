//
//  UserClass.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class user: NSObject, NSCoding{
    
    var name: String!
    var color: String!
    var point: Int!
    
    init(name: String, color: String, point: Int){
        
        self.name = name
        self.color = color
        self.point = point
        
    }
    
    required init?(coder: NSCoder){
        
        name = (coder.decodeObject(forKey: "name") as? String) ?? ""
        color = (coder.decodeObject(forKey: "color") as? String) ?? ""
        point = (coder.decodeInteger(forKey: "point"))
        
    }
    
    func encode(with coder: NSCoder) {
        
        coder.encode(name,forKey: "name")
        coder.encode(color,forKey: "color")
        coder.encode(point,forKey: "point")
    }
    
    func getImage() -> UIImage{
        
        return UIImage(named: color)!
        
    }
    
}
