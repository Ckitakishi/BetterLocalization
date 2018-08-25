//
//  SelectionListViewController.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/25.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import UIKit

enum SelectionType {
    case undefined
    case language
    case currency
}

class SelectionViewController: UITableViewController {
    
    var codes: [String]!
    
    var selectionType: SelectionType = .undefined {
        didSet {
            switch selectionType {
            case .currency:
                codes = NSLocale.commonISOCurrencyCodes
            case .language:
                codes = ["中文", "English", "日本語", "العربية"]
            default:
                codes = []
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension SelectionViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "SelectionCell"), for: indexPath)
        cell.textLabel?.text = codes[indexPath.row]
        return cell
    }
}
