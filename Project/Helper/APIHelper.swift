//
//  APIHelper.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import Foundation

let apiClient = APIClient()

    func fetchTableData(completion: @escaping (_ success: Bool, _ object: [String:Any]?) -> ()) {
        let tableDataRequest = apiClient.makeGETRequest(url: URL(string:Constants.tableDataUrl)! , params: nil)
                      
                      apiClient.get(request: tableDataRequest as URLRequest) { (success, jsonObject) in
                          print(jsonObject as Any)
                            completion(success, jsonObject)
                      }
    }
