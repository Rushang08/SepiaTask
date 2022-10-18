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
    
    init(image_url: String?,title: String?,content_url: String?,date_added: String?){
        
        self.image_url = image_url
        self.title = title
        self.content_url = content_url
        self.date_added = date_added
    }
}
