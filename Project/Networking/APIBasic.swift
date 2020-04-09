//
//  APIBasic.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/7/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import Foundation
class APIBasic: NSObject {
    
    var session : URLSession?
    var dataTask : URLSessionDataTask?
    
    override init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func apiDataTask(urlString : String,  completion : @escaping (_ data : Data?, _ response : URLResponse?, _ error : Error?)->Void ){
        dataTask = session?.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
            completion(data,response,error)
        })
        dataTask?.resume()
    }
}
