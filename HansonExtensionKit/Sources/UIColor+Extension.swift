//
//  UIColor+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/2.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

extension UIColor: HansonCompatible { }
extension HansonExtensionKit where T: UIColor {
    
    public static func color(rgba: String) -> UIColor {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            var hexStr = (rgba as NSString).substring(from: 1) as NSString
            if hexStr.length == 8 {
                let alphaHexStr = hexStr.substring(from: 6)
                hexStr = hexStr.substring(to: 6) as NSString
                var alphaHexValue: UInt32 = 0
                let alphaScanner = Scanner(string: alphaHexStr)
                if alphaScanner.scanHexInt32(&alphaHexValue) {
                    let alphaHex = Int(alphaHexValue)
                    alpha = CGFloat(alphaHex & 0x000000FF) / 255.0
                } else {
                    print("scan alphaHex error")
                }
            }
            
            let rgbScanner = Scanner(string: hexStr as String)
            var hexValue: UInt32 = 0
            if rgbScanner.scanHexInt32(&hexValue) {
                if hexStr.length == 6 {
                    let hex = Int(hexValue)
                    red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hex & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hex & 0x0000FF) / 255.0
                } else {
                    print("invalid rgb string, length should be 6")
                }
            } else {
                print("scan hex error")
            }
            
        } else {
            print("invalid rgb string, missing '#' as prefix")
        }
        return UIColor(red:red, green:green, blue:blue, alpha:alpha)
    }
}