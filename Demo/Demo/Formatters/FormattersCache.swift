//
//  FormattersCache.swift
//  Demo
//
//  Created by Ckitakishi on 2018/8/26.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import Foundation

var dateFormatter: DateFormatter?
var priceFormatter: NumberFormatter?
var acreageFormatter: MeasurementFormatter?

class FormattersCache: NSObject {
    
    func dateString(_ date: Date) -> String {
        if (dateFormatter == nil) {
            dateFormatter = DateFormatter()
            dateFormatter?.dateStyle = .full
        }
        return dateFormatter!.string(from: date)
    }
    
    func priceString(_ price: Double) -> String {
        if (priceFormatter == nil) {
            priceFormatter = NumberFormatter()
            priceFormatter?.numberStyle = .currency
            priceFormatter?.currencyCode = "CNY"
            priceFormatter?.minimumFractionDigits = 0
        }
        return priceFormatter!.string(from: price as NSNumber)!
    }
    
    func acreageString(_ acreage: Double) -> String {
        if (acreageFormatter == nil) {
            acreageFormatter = MeasurementFormatter()
            acreageFormatter?.unitStyle = .medium
            acreageFormatter?.unitOptions = .naturalScale
        }
        return acreageFormatter!.string(from: Measurement(value: acreage, unit: UnitArea.squareMeters))
    }
}

