//
//  APIClient.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import Foundation
import UIKit

public class APIClient: NSObject {
    
    private var session: URLSession!
    var dataTask: URLSessionDataTask?
    var downloadTask : URLSessionDownloadTask?
    
    override public init() {
        super.init()
        self.session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
    }
    
   
    
    // MARK: Client request with JSON response task
    public  func apiJsonDataTask(request: URLRequest, completion: @escaping (_ success: Bool, _ data: Data?, _ error: Error? ) -> ()) {
        
        self.apiDataTask(request: request) { (success, dataObject,error) in
            //Addition Conversion to String and Then Back to Data
            if success == true {
                        let str = String(decoding: dataObject!, as: UTF8.self)
                        let dataObj = Data(str.utf8)
                        completion(success,dataObj,error)
                       } else {
                        completion(success, dataObject,error)
                       }
            }
    }
    
    public  func apiImageDataTask(request: URLRequest, completion: @escaping (_ success: Bool, _ image: UIImage?, _ error: Error? ) -> ()) {
        
        self.apiDataTask(request: request) { (success, dataObject,error) in
            var img : UIImage?
            if success == true {
                        img = UIImage(data: dataObject!)
                        completion(success,img,error)
                       } else {
                        completion(success, img,error)
                       }
            }
    }
    
    
    // MARK: Client request with data response task
    public func apiDataTask(request: URLRequest, completion: @escaping (_ success: Bool, _ object: Data?, _ error : Error?) -> ()) {
        dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            print(data as Any)
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error?.localizedDescription))")
                
                completion(false, nil,error)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                print("Data: \(String(describing: String.init(data: data, encoding: .utf8)))")
                completion(false, data,error)
            } else {
                completion(true, data,error)
            }
        }
        dataTask?.resume()
    }
    
    // MARK: cancel current running Task
    public func cancelTask() -> Void {
        if dataTask?.state == .running {
            dataTask?.cancel()
        }
    }
    
    // MARK: get Task State
    public func getTaskState() -> URLSessionTask.State?  {
        return dataTask?.state
    }
    
    // MARK: check task is in running state
    public func isTaskCanceled() -> Bool  {
        return dataTask?.state == .canceling
    }
    
    // MARK: composition methods
     func get(request: URLRequest, completion: @escaping (_ success: Bool, _ data: Data?, _ error : Error?) -> ()) {
        apiJsonDataTask(request: request, completion: completion)
    }
   
    //MARK: make client request
    public func makeGETRequest(url: URL, params: [String:Any]? = nil) -> URLRequest {
        
        var requestUrl = url.absoluteString
        
        if let params = params, params.count > 0 {
            let paramString =  getParamString(params: params)
            requestUrl += "?\(paramString)"
        }
        let request = URLRequest.init(url: URL(string: requestUrl)!,cachePolicy: .useProtocolCachePolicy, timeoutInterval: Constants.requestTimeOutInterval)
        return request
    }
    

    private func getParamString(params: [String: Any]) -> String {
        var paramString = ""
        for (key, value) in params {
            if let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                let escapedValue = ((value as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
                paramString += "&\(escapedKey)=\(escapedValue)"
            }
        }
        return paramString
    }
    
}


