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
        let room1 = RoomModel(name: NSLocalizedString("mock.room.name", comment: "room name"),
                              price: 10000,
                              size: 35,
                              peopleLimit: "2",
                              hasWifi: true,
                              meals: NSLocalizedString("mock.room.meals", comment: "meals of room"),
                              surplus: 0)
        
        let room2 = RoomModel(name: NSLocalizedString("mock.room.name", comment: "room name"),
                              price: 12000,
                              size: 38,
                              peopleLimit: "2",
                              hasWifi: true,
                              meals: NSLocalizedString("mock.room.meals", comment: "meals of room"),
                              surplus: 3)
        
        roomItems = [room1, room2]
    }
}
