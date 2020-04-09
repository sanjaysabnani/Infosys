//
//  CustomImageView.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/9/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit
var ImageCache = [URL:UIImage]()
class CustomImageView: UIImageView {
func loadImageFromNetwork(url : URL?,completion: @escaping(_ success : Bool)->()) {
        guard let url = url else{return}
        self.image = nil
        if let img = ImageCache[url]  {
            self.image = img
        }
        else {
            fetchCellImages(url: url) { (success, image, error) in
                if error == nil {
                    DispatchQueue.main.async {
                   ImageCache[url] = image
                        self.image = image
                        completion(success)
                    }
                }
            }
        }
    }
}
