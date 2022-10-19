//
//  PetsTableViewCell.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgViewPet: ImageLoader!
    @IBOutlet weak var lblPetName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension PetsTableViewCell {
    
    func setupData(petData:Pets) {
        self.lblPetName?.text = petData.title
        self.imgViewPet?.loadImageWithUrl(URL(string: petData.image_url!)!)
    }

}
