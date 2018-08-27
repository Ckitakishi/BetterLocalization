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
    let price: Double
    // Detail
    let size: Double
    let peopleLimit: String
    let hasWifi: Bool
    let meals: String
    let surplus: Int
    //...
}

extension RoomModel {
    
    // Mock Data =>
    func detailInfo() -> [(String, String)] {
        return [
            (NSLocalizedString("detail.roomsize", comment: "title of room size"), FormattersCache.acreageString(size)),
            (NSLocalizedString("detail.fits", comment: "title of poople limit"), peopleLimit),
            (NSLocalizedString("detail.meals", comment: "title of meals"), meals),
            (NSLocalizedString("detail.wifi", comment: "title of wifi"), hasWifi ?
                NSLocalizedString("detail.yes", comment: "has wifi?(yes)") :
                NSLocalizedString("detail.no", comment: "has wifi?(no)"))
        ]
    }
}
