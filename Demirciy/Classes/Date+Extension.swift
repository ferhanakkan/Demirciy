//
//  Date+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public extension Date {
    
    var day: Int {
        return Calendar.current.component(Calendar.Component.day, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }
    
    var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }
    
    init?(dateString: String, format: String, locale: String = Locale.current.languageCode ?? "en") {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: locale)
        
        self = dateFormatter.date(from: dateString) ?? Date()
    }
    
    func toString(format: String, dateSeparator: String = DConstant.DDateConstant.dateSeparator, timeSeparator: String = DConstant.DDateConstant.timeSeparator, locale: String = Locale.current.languageCode ?? "en") -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = format
        dateFormatterGet.locale = Locale(identifier: locale)
        return dateFormatterGet.string(from: self)
            .replacingOccurrences(of: DConstant.DDateConstant.dateSeparator, with: dateSeparator)
            .replacingOccurrences(of: DConstant.DDateConstant.timeSeparator, with: timeSeparator)
    }
    
    func totalDistance(to date: Date, resultIn component: Calendar.Component) -> Int? {
        return Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }
}
