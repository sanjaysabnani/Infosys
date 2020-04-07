//
//  CustomViewModel.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

struct CustomViewModel {
    var title : String?
    var descriptn : String?
    var image : UIImage?
    
    init(customModel:CustomModel) {
        self.title = customModel.title
        self.descriptn = customModel.description
        self.image = nil
    }

}
