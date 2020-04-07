//
//  CustomCell.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
        var customViewModel : CustomViewModel? {
        didSet {
            self.textLabel?.text = customViewModel?.title
            self.detailTextLabel?.text = customViewModel?.descriptn ?? "TEST"
            self.imageView?.image =  customViewModel?.image
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
