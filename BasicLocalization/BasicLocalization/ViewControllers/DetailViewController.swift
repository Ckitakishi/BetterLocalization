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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var surplusLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var roomDataSource: RoomModel?
    
    var detailDataSource: [(String, String)] = [] {
        didSet {
            detailTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.dataSource = self
        detailTableView.tableHeaderView = headerView
        detailTableView.sectionHeaderHeight = UITableView.automaticDimension
        
        nameLabel.text = roomDataSource?.name
        
        updatePrice()
        
        surplusLabel.text = String.localizedStringWithFormat(NSLocalizedString("detail.only %d room left",comment: "surplus"),(roomDataSource?.surplus)!)
        
        guard let details = roomDataSource?.detailInfo() else {
            fatalError("..!")
        }
        detailDataSource = details
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePrice), name: NSNotification.Name(CurrencyChangeNotification), object: nil)
    }
    
    @objc func updatePrice() {
        if let price = roomDataSource?.price {
            pricelabel.text = FormattersCache.priceString(price)
        }
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

