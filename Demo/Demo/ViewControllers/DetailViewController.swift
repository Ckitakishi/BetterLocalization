//
//  DetailViewController.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/23.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var pricelabel: UILabel!
    
    var roomDataSource: RoomModel?
    
    var detailDataSource: [(String, String)] = [] {
        didSet {
            detailTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.dataSource = self
        roomDataSource = RoomMock.shared.roomItems[0]
        guard let details = roomDataSource?.detailInfo() else {
            fatalError("..!")
        }
        detailDataSource = details
    }
}

// Mark: UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailCell.self), for: indexPath) as! DetailCell
        cell.cellDataSource = detailDataSource[indexPath.row]
        return cell
    }
}

