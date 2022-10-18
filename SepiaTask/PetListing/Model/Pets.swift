//
//  Pets.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit

class Pets {
    
    var image_url: String?
    var title: String?
    var content_url: String?
    var date_added: String?
    
    init(petData:[String : Any]){
        
        self.image_url = petData["image_url"] as? String
        self.title = petData["title"] as? String
        self.content_url = petData["content_url"] as? String
        self.date_added = petData["date_added"] as? String
        
    }
}
