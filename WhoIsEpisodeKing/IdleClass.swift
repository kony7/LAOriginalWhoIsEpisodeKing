//
//  IdleClass.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class idle{
    
    var group: String!
    var name: String!
    var imageName: String!
    
    init(group: String, name: String, imageName:String){
        
        self.group = group
        self.name = name
        self.imageName = imageName
        
    }
    
    func getImage() -> UIImage{
        
        return UIImage(named: imageName)!
        
    }
    
}
