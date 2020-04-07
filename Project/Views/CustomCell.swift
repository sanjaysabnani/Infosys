//
//  CustomCell.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
        var customViewModel : CustomViewModel? {
        didSet {
            self.titleLabel.text = customViewModel?.title
            self.descriptionLabel.text = customViewModel?.descriptn
            self.imageView?.image =  customViewModel?.image
            
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: "CustomCell")
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont(name: "Arial-Bold", size: 16.0)
        self.contentView.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        self.descriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textColor = .gray
        self.descriptionLabel.font = UIFont(name: "Arial", size: 12.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
