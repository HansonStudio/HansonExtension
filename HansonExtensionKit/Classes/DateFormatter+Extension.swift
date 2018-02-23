//
//  DateFormatter+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2018/2/22.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Foundation

private var cachedFormatters = [String : DateFormatter]()

extension DateFormatter: HansonExtensionProtocol {}
extension HansonExtensionKit where T: DateFormatter {
    
    public static func cached(withFormat format: String) -> DateFormatter {
        if let cachedFormatter = cachedFormatters[format] { return cachedFormatter }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        cachedFormatters[format] = formatter
        return formatter
    }
}
