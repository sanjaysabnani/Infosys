//
//  CustomViewModel.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

class CustomViewModel {
    var title : String?
    var descriptn : String?
    var image : UIImage?
    var imgHref : URL?
    
    init(customModel:ImageModel) {
        self.title = customModel.title
        self.descriptn = customModel.description
        self.imgHref = URL(string: customModel.imageHref ?? "")
    }

}
