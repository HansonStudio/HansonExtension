//
//  Double+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/20.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
extension Double: HansonExtensionProtocol { }
extension HansonExtensionKit where T == Double {
    
    /// 转字符，去掉小数点后无效的0
    ///
    /// - Parameter maxDecimal: 小数点后最大位数
    /// - Returns: 格式化的字符
    public func formatDecimalString(maxDecimal: Int) -> String {
        let fmt = NumberFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.maximumFractionDigits = maxDecimal
        fmt.minimumFractionDigits = 0
        let number = NSNumber(value: wrappedValue)
        return fmt.string(from: number) ?? "--"
    }
    
    
    /// 转字符，保留小数点后几位
    ///
    /// - Parameter f: 小数点后最大位数
    /// - Returns: 格式化的字符
    public func format(f: String) -> String {
        return String(format: "%\(f)f", wrappedValue)
    }
    
    public func toPercentFormat() -> String {
        return String(format: "%.2f", wrappedValue * 100) + "%"
    }
    
    /// 转带万、亿 单位字符，保留小数点后无效的0
    ///
    /// - Parameter maxDecimal: 小数点后最多位数
    /// - Returns: 带 万 或 亿 单位的格式化字符
    public func toNumberFormat(maxDecimal: Int) -> String {
        let value = abs(wrappedValue)
        var formateStr: String = ""
        if (value < 10000.0) {
            formateStr = wrappedValue.hsExt.formatDecimalString(maxDecimal: maxDecimal)
            
        } else if (value >= 10000.0 && value < 100000000.0) {
            formateStr = (value / 10000.0).hsExt.formatDecimalString(maxDecimal: maxDecimal) + "万"
            
        } else if (value >= 100000000.0 && value < 1000000000000.0) {
            formateStr = (value / 100000000.0).hsExt.formatDecimalString(maxDecimal: maxDecimal) + "亿"
        } else {
            formateStr = (value / 1000000000000.0).hsExt.formatDecimalString(maxDecimal: maxDecimal) + "万亿"
        }
        if wrappedValue < 0 {
            return "-" + formateStr
        } else {
            return formateStr
        }
    }
    
    public func toDate() -> Date {
        let d: TimeInterval  = wrappedValue/1000
        
        return Date(timeIntervalSince1970: d)
    }
}
