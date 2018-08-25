//
//  RoomMock.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/23.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import Foundation

final class RoomMock {
    
    static let shared = RoomMock()
    var roomItems: [RoomModel] = []
    
    init() {
        let room1 = RoomModel(name: "Basic Room",
                              price: "10000",
                              size: "35",
                              peopleLimit: "2",
                              hasWifi: true,
                              meals: "Breakfast + Dinner",
                              surplus: "3")
        roomItems = [room1]
    }
}
