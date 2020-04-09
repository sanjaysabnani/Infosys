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
        self.setupStatusBar()

        
    }
    
    
    func setupTableView() ->Void {
        tableView = UITableView(frame: self.view.bounds,style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 100
        self.view.addSubview(tableView!)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
     
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
    
    func setupStatusBar() ->Void {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.view.layoutIfNeeded()
        let animationHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = { [weak self] (context) in
            // This block will be called several times during rotation,
            // so if you want your tableView change more smooth reload it here too.
            self?.tableView?.reloadData()
        }

        let completionHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = { [weak self] (context) in
            // This block will be called when rotation will be completed
            self?.tableView?.reloadData()
        }
        coordinator.animate(alongsideTransition: animationHandler, completion: completionHandler)
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
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}

