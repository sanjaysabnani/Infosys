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

  let apiClient = APIClient()
  
    func loadImageFromNetwork(url : URL?) {
        guard let url = url else{return}
        self.image = nil
       print("IMAGE CACHE \(ImageCache)")
        if let img = ImageCache[url]  {
            self.image = img
        }
        else {
            let cellImageRequest = apiClient.makeGETRequest(url: url , params: nil)
           apiClient.apiImageDataTask(request: cellImageRequest) { [weak self](success, img, error) in
            if error == nil {
                DispatchQueue.main.async {
               ImageCache[url] = img
                    self?.image = img
                }
            }
           }
        }
    }
}
