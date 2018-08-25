//
//  RoomModel.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/23.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import Foundation

struct RoomModel {
    // Make most of properties as String..
    // List
    let name: String
    let price: String
    // Detail
    let size: String
    let peopleLimit: String
    let hasWifi: Bool
    let meals: String
    let surplus: String
    //...
}

extension RoomModel {
    
    // Mock Data =>
    func detailInfo() -> [(String, String)] {
        return [
            ("Room Size", size),
            ("Fits", peopleLimit),
            ("Meals", meals),
            ("Wifi", hasWifi ? "YES" : "NO")
        ]
    }
}
