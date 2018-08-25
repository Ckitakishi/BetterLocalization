//
//  ListViewController.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/23.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var roomDataSource: [RoomModel] = [] {
        didSet {
            listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        roomDataSource = RoomMock.shared.roomItems
    }
}

// Mark: UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

// Mark: UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RoomCell.self), for: indexPath) as! RoomCell
        cell.cellDataSource = roomDataSource[indexPath.row]
        return cell
    }
}
