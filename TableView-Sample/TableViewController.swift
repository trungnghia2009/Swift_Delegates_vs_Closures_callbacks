//
//  ViewController.swift
//  TableView-Sample
//
//  Created by trungnghia on 4/28/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "None", style: .plain, target: self, action: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        cell.backgroundColor = .yellow
        cell.index = indexPath.item
        
        cell.didTapChangeNavigationTitle = {[weak self] title in
            self?.navigationItem.title = title
        }
        
        cell.didTapChangeBackgroundColor = { [weak self] color in
            self?.tableView.backgroundColor = color
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

extension TableViewController: DidChangeRightBarButton {
    func changeRightBarButton(_ index: Int) {
        if index % 2 == 0 {
            navigationItem.rightBarButtonItem?.title = "True"
        } else {
            navigationItem.rightBarButtonItem?.title = "False"
        }
    }
    

    
    
}
