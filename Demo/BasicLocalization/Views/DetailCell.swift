//
//  DetailCell.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/25.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var cellDataSource: (String, String)! {
        didSet {
            titleLabel.text = cellDataSource.0
            contentLabel.text = cellDataSource.1
        }
    }
}
