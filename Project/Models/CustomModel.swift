//
//  CustomData.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

struct CustomModel {

    var title : String?
    var descriptn : String?
    var imageRef : String?

    init(title : String? = "", descriptn : String? = "", imageRef: String? = "") {
        self.title = title
        self.descriptn = descriptn
        self.imageRef = imageRef
    }
}
