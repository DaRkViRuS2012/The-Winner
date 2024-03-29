//
//  DateHelper.swift
//  BrainSocket Code base
//
//  Created by BrainSocket on 12/25/16.
//  Copyright © 2016 . All rights reserved.
//
import UIKit

// MARK: Date helper
struct DateHelper {
    
    /// Get date from iso string
    static func getDateFromISOString(_ dateStr: String) -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        return dateFormater.date(from: dateStr)
    }
    
    /// Get iso date string from date object
    static func getISOStringFromDate(_ date: Date) -> String? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        return dateFormater.string(from: date)
    }

    /// Get date from  string
    static func getDateFromString(_ dateStr: String) -> Date? {
        let dateFormater = DateFormatter()
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.date(from: dateStr)
    }


    /// Get  date string from date object
    static func getStringFromDate(_ date: Date) -> String? {
        let dateFormater = DateFormatter()
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: date)
    }
    
    static func getBirthFormatedStringFromDate(_ date: Date) -> String? {
        let dateFormater = DateFormatter()
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        dateFormater.dateFormat = "dd MMM yyyy"
        return dateFormater.string(from: date)
    }
    
    static func getBirthDateFromString(_ dateStr: String) -> Date? {
        let dateFormater = DateFormatter()
        let loc = Locale(identifier: "us")
        dateFormater.locale = loc
        dateFormater.dateFormat = "dd MMM yyyy"
        return dateFormater.date(from: dateStr)
    }
    
    /// Get iso date string from date object
    static func getISOStringFromTimestamp(_ timestamp: Double) -> String? {
        let timestampDate = NSDate(timeIntervalSince1970: Double(timestamp as NSNumber)/1000)
        return getISOStringFromDate(timestampDate as Date)
    }
    
    
    static func getDayFrom(date:Date) -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayInWeek = formatter.string(from: date)
        return dayInWeek
    }
    
    static func getDayNumberFrom(date:Date) ->Int{
        let dayNumber = Calendar.current.component(.weekday, from: date)
        return dayNumber
    }
    
    static func ellapsedString(fromDate date:Date?) -> String {
        guard let created = date?.timeIntervalSince1970 else {
            return ""
        }
        
        let now = Int(NSDate().timeIntervalSince1970)
        let difference = now - Int(created)
        let seconds : Int = Int(difference)
        let minutes : Int = Int(difference / 60)
        let hours : Int = Int(difference / (60*60))
        let days  : Int = Int(difference / (60*60*24))
        let monthes : Int = Int(difference / (60*60*24*30))
        let years : Int = Int(difference / (60*60*24*30*12))
        var result: String = ""
        
        if years > 0 {
            let componentKey = years > 1 ?"YEARS_AGO".localized : "YEAR_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: years))! )
        }
        else if monthes > 0 {
            let componentKey = monthes > 1 ? "MONTHS_AGO".localized : "MONTH_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: monthes))!)
        }
        else if days > 0 {
            let componentKey = days > 1 ?"DAYS_AGO".localized : "DAY_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: days))!)
        }
        else if hours > 0 {
            let componentKey = hours > 1 ? "HOURS_AGO".localized : "HOUR_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: hours))!)
        }
        else if minutes > 0 {
            let componentKey = minutes > 1 ? "MINUTES_AGO".localized :"MINUTE_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: minutes))!)
        }
        else if seconds > 0 {
            //fix negative seconds
            let componentKey = seconds > 1 ?
                "SECONDS_AGO".localized: "SECOND_AGO".localized
            result = String(format: componentKey,NumberFormatter().string(from: NSNumber(value: seconds))!)
        }
        else
        {
            result = "NOW".localized
        }
        return result
    }
}
