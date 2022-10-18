//
//  PetsTableViewCell.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgViewPet: UIImageView!
    @IBOutlet weak var lblPetName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setupData(arrDict:[String : Any]) {
                
        self.lblPetName?.text = arrDict["title"] as? String
        self.imgViewPet?.imageFromUrl(urlString: arrDict["image_url"] as! String)
        
    }

}
