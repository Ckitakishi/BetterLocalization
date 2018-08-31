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

open class FormattersCache: NSObject {
    
    class func clearAllFormatter() {
        dateFormatter = nil
        priceFormatter = nil
        acreageFormatter = nil
    }
    
    class func dateString(_ date: Date) -> String {
        if (dateFormatter == nil) {
            dateFormatter = DateFormatter()
            dateFormatter?.dateStyle = .long
        }
        return dateFormatter!.string(from: date)
    }
    
    class func priceString(_ price: Double) -> String {
        if (priceFormatter == nil) {
            priceFormatter = NumberFormatter()
            priceFormatter?.numberStyle = .currency
            priceFormatter?.currencyCode = Localize.currentCurrency()
            priceFormatter?.minimumFractionDigits = 0
        }
        return priceFormatter!.string(from: price as NSNumber)!
    }
    
    class func acreageString(_ acreage: Double) -> String {
        if (acreageFormatter == nil) {
            acreageFormatter = MeasurementFormatter()
            acreageFormatter?.unitStyle = .medium
            acreageFormatter?.unitOptions = .naturalScale
        }
        return acreageFormatter!.string(from: Measurement(value: acreage, unit: UnitArea.squareMeters))
    }
}

