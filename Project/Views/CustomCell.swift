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
    var cellImageView = CustomImageView()
    var customViewModel : CustomViewModel? {
        didSet {
            self.titleLabel.text = customViewModel?.title
            self.descriptionLabel.text = customViewModel?.descriptn
            self.cellImageView.loadImageFromNetwork(url: (customViewModel?.imgHref),completion:({success in
               if success {
                DispatchQueue.main.async {
                        if let tableView = self.superview as? UITableView {
                        guard let indexPath = tableView.indexPath(for: self) else {
                            return
                        }
                        tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                    }
                }
            }))
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: "CustomCell")
        self.setConstraints()
       
    }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
   private func setConstraints() {
        
               self.contentView.addSubview(self.cellImageView)
               self.cellImageView.translatesAutoresizingMaskIntoConstraints = false
               self.cellImageView.contentMode = .scaleAspectFit
               self.cellImageView.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor).isActive = true
               self.cellImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor,constant: 10).isActive = true
               
               self.contentView.addSubview(self.titleLabel)
               self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
                self.titleLabel.centerXAnchor.constraint(equalTo: cellImageView.centerXAnchor).isActive = true
               self.titleLabel.topAnchor.constraint(equalTo: self.cellImageView.bottomAnchor,constant: 10).isActive = true
//               self.titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -10).isActive = true
               self.titleLabel.numberOfLines = 0
               self.titleLabel.font = UIFont(name: "Arial-Bold", size: 16.0)
               self.contentView.addSubview(self.descriptionLabel)
               self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
                self.descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
               self.descriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
               self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
                self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
               self.descriptionLabel.numberOfLines = 0
               self.descriptionLabel.textColor = .gray
               self.descriptionLabel.font = UIFont(name: "Arial", size: 12.0)
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
