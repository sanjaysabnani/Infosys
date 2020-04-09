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
    var customModels = [ImageModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setupTableViewConstraints()
        self.populateTableView()
        
    }
    
    
    private func setupTableView() ->Void {
        tableView = UITableView(frame: self.view.bounds,style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 100
        self.view.addSubview(tableView!)
    }
    
    private func setupTableViewConstraints() ->Void {
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
   private func populateTableView() {
        fetchTableData{(success, customModel ,error) in
                   if success {
                       if let title = customModel?.title   {
                            DispatchQueue.main.async  {
                           self.title = (title)
                           }
                       }
                       if let rows = customModel?.rows{
                           self.customModels = rows
                           DispatchQueue.main.async  {
                           self.tableView?.reloadData()
                           }
                       }
                   }
                       else {
                       DispatchQueue.main.async {
                           let alertView =  UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                           let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                           alertView.addAction(okButton)
                                         self.present(alertView, animated: true, completion: nil)
                       }
                    }
               }
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = CustomCell(style: .value1, reuseIdentifier: "CustomCell")
        customCell.customViewModel = CustomViewModel(customModel: customModels[indexPath.row])
        return customCell
    }
}

