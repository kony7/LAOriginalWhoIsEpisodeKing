//
//  UserClass.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class user{
    
    var name: String!
    var color: String!
    var point: Int!
    
    init(name: String, color: String, point: Int){
        
        self.name = name
        self.color = color
        self.point = point
        
    }
    
    func getImage() -> UIImage{
        
        return UIImage(named: color)!
        
    }
    
}
