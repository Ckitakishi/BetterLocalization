//
//  RoomCell.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/23.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var cellDataSource: RoomModel! {
        didSet {
            priceLabel.text = cellDataSource.price
            nameLabel.text = cellDataSource.name
            // TODO:
            // iconImageView
        }
    }
}
