//
//  Date+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/4.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

extension Date: HansonExtensionProtocol { }
extension HansonExtensionKit where T == Date {
    
    
    /// 
    ///
    /// - Parameter dateString: yyyyMMddHHmmss
    /// - Returns:
    public static func getTimeAgoString(_ dateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        if let date = dateFormatter.date(from: dateString) {
            return getTimeAgoFormat(date)
        }else {
            return " "
        }
    }
    
    public static func getTimeAgoFormat(_ date: Date) -> String {
        let currentDate = Date()
        let timeInterval = currentDate.timeIntervalSince(date)
        var time: TimeInterval = 1
        var resultTime = 0
        
        if (timeInterval < 60) {
            return "刚刚"
            
        }else if (timeInterval < 3600) {
            time = timeInterval / 60
            time = time <= 0 ? 1 : time
            resultTime = Int(round(time))
            return "\(resultTime)分钟前"
            
        }else if(timeInterval < 3600 * 24) {
            time = timeInterval / 3600
            time = time <= 0 ? 1 : time
            resultTime = Int(round(time))
            return "\(resultTime)小时前"
            
        }else if(timeInterval < 3600 * 24 * 30) {
            time = timeInterval / (3600 * 24)
            time = time <= 0 ? 1 : time
            resultTime = Int(round(time))
            return "\(resultTime)天前"
            
        }else if(timeInterval < 3600 * 24 * 30 * 12){
            time = timeInterval / (3600 * 24 * 30)
            time = time <= 0 ? 1 : time
            resultTime = Int(round(time))
            return "\(resultTime)个月前"
        }else {
            time = timeInterval / (3600 * 24 * 30 * 12)
            time = time <= 0 ? 1 : time
            resultTime = Int(round(time))
            return "\(resultTime)年前"
        }
    }
}
