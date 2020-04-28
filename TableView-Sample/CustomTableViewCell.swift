//
//  CustomTableViewCell.swift
//  TableView-Sample
//
//  Created by trungnghia on 4/28/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit


protocol DidChangeRightBarButton: class {
    func changeRightBarButton(_ index: Int)
}

class CustomTableViewCell: UITableViewCell {

    var index: Int?
    weak var delegate: DidChangeRightBarButton?
    var didTapChangeBackgroundColor: ((UIColor) -> Void)?
    var didTapChangeNavigationTitle: ((_ text: String) -> Void)?
    
    // Using closure callbacks
    @IBAction func changeNavigationTitleButtonPressed(_ sender: Any) {
        print("Change Navigation title tapped...")
        print("title: \(index!)")
        let title = String(index!)
        didTapChangeNavigationTitle?(title)
    }
    
    // Using clouser callbacks
    @IBAction func changeBackgroundColorButtonPressed(_ sender: Any) {
        print("Change backgound tapped....")
        var color = UIColor.clear
        
        if index! % 2 == 0 {
            color = .blue
        } else {
            color = .green
        }
        
        didTapChangeBackgroundColor?(color)
    }
    
    // Using Delegate
    @IBAction func changeRightBarButtonTapped(_ sender: Any) {
        delegate?.changeRightBarButton(index!)
    }
    
}
