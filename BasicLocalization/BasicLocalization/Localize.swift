//
//  Localize.swift
//  Demo
//
//  Created by chin on 2018/08/27.
//  Copyright © 2018年 Yuhan Chen. All rights reserved.
//

import Foundation

public let LanguageChangeNotification = "LanguageChangeNotification"
public let CurrencyChangeNotification = "CurrencyChangeNotification"
public let CurrentLanguageKey = "CurrentLanguageKey"
public let CurrentCurrencyKey = "CurrentCurrencyKey"

open class Localize: NSObject {
    
    open class func currentLanguage() -> String {
        if let currentLanguage = UserDefaults.standard.object(forKey: CurrentLanguageKey) as? String {
            return currentLanguage
        }
        return "en-US"
    }
    
    open class func setCurrentLanguage(_ language: String) {
        if (language != currentLanguage()){
            UserDefaults.standard.set(language, forKey: CurrentLanguageKey)
            UserDefaults.standard.set([language], forKey: "AppleLanguages")
            NotificationCenter.default.post(name: Notification.Name(rawValue: LanguageChangeNotification), object: nil)
        }
    }
    
    open class func currentCurrency() -> String {
        if let currentCurrency = UserDefaults.standard.object(forKey: CurrentCurrencyKey) as? String {
            return currentCurrency
        }
        return NSLocale.current.currencyCode ?? ""
    }
    
    open class func setCurrentCurrency(_ currency: String) {
        if (currency != currentCurrency()){
            UserDefaults.standard.set(currency, forKey: CurrentCurrencyKey)
            NotificationCenter.default.post(name: Notification.Name(rawValue: CurrencyChangeNotification), object: nil)
        }
    }
}
