//
//  CustomData.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

struct CustomModel : Codable {

    var title : String?
    var description : String?
    var imageHref : String?

    init(title : String? = "", description : String? = "", imageHref: String? = "") {
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
}
