//
//  ViewController.swift
//  Project
//
//  Created by Sanjay Sabnani on 4/6/20.
//  Copyright © 2020 Sanjay Sabnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView : UITableView?
    var apiClient = APIClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setupStatusBar()

        
    }
    
    
    func setupTableView() ->Void {
        tableView = UITableView(frame: self.view.bounds,style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        
        fetchTableData{(success, jsonObject) in
            if(success) {
                if let jsonObject = jsonObject {
//                    print(jsonObject)
                }
            }
        }
    
    }
    
    func fetchTableData(completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        let tableDataRequest = apiClient.makeGETRequest(url: URL(string:Constants.tableDataUrl)! , params: nil)
                      
                      apiClient.get(request: tableDataRequest as URLRequest) { (success, jsonObject) in
                          print(jsonObject as Any)
                          if success {
//                              print(jsonObject as Any)
                          }
                          completion(success, jsonObject)
                      }
    }
    
    func setupStatusBar() ->Void {
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           super.viewWillTransition(to: size, with: coordinator)
           if UIDevice.current.orientation.isLandscape {
               print("Landscape")
              
           } else {
               print("Portrait")
             
           }
       }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = UITableViewCell()
        
        return customCell
    }
    
    
}

