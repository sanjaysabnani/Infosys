//
//  Constants.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import Foundation
struct  Constants {
    public static let PDS = "/"
    public static let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    public static let requestTimeOutInterval:TimeInterval = 300
    public static let jsonContentType = "application/json"
    public static let tableDataUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
   
}
