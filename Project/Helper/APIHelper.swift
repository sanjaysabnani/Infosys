//
//  APIHelper.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import Foundation
import UIKit

let apiClient = APIClient()

func fetchTableData(completion: @escaping (_ success: Bool, _ customModel : CustomModel?,_ error : Error?) -> ()) {
        let tableDataRequest = apiClient.makeGETRequest(url: URL(string:Constants.tableDataUrl)! , params: nil)
                      
                      apiClient.get(request: tableDataRequest as URLRequest) { (success, jsonObject,error) in
                        let customModel = try? JSONDecoder().decode(CustomModel.self, from: jsonObject!)
                            completion(success, customModel,error)
                      }
    }

func fetchCellImages(url : URL , completion :@escaping(_ success : Bool, _ img : UIImage, _ error : Error?)->Void){
    let cellImageRequest = apiClient.makeGETRequest(url: url , params: nil)
    apiClient.apiImageDataTask(request: cellImageRequest) { (success, img, error) in
        completion(success,img ?? UIImage(),error)
    }
}
