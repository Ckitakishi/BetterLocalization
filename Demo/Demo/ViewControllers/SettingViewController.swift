//
//  SettingViewController.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/24.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

let sectionTitles = ["Language", "Currency"]

class SettingViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        guard let nav = segue.destination as? UINavigationController,
              let des = nav.viewControllers[0] as? SelectionViewController else {
            fatalError()
        }
        if (cell.textLabel?.text == sectionTitles[0]) {
            des.selectionType = .language
        } else {
            des.selectionType = .currency
        }
    }
}

// Mark: UITableViewDataSource
extension SettingViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "SettingCell"), for: indexPath)
        cell.textLabel?.text = sectionTitles[indexPath.section]
        return cell
    }
}
