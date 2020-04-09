//
//  DownloadClient.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/9/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

class DownloadClient: NSObject, URLSessionDelegate {
    var downloadSession : URLSession?
    var downloadTask : URLSessionDownloadTask?
    
    override init() {
        super.init()
        self.downloadSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
    }
    
    public  func apiDownloadTask(url: URL, completion : @escaping(_ fileURL : URL?, _ response : URLResponse?, _ error : Error?)->Void){
        downloadTask = self.downloadSession?.downloadTask(with: url) { (fileURL, response, error) in
            var savedFileURL : URL?
            if(error == nil) {
                savedFileURL = self.getDirectoryPath(with:"Images",url: url)
                print(savedFileURL?.absoluteString)
                
            }
            completion(fileURL,response,error)
        }
        downloadTask?.resume()
    }
    

    
    func getDirectoryPath(with newFolderName : String, url : URL) -> URL
     {
        let filePathString = "\(newFolderName)\(Constants.PDS)\(url.lastPathComponent)"
        return URL(string: Constants.documentDirectory)!.appendingPathComponent(filePathString)
    }
}
