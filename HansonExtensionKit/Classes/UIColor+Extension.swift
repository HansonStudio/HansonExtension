//
//  UIColor+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/2.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

extension UIColor: HansonExtensionProtocol { }
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
    
    public static func color(red: Int, green: Int, blue: Int, al: CGFloat) -> UIColor {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: al)
    }
    
    
    /// - Parameters:
    ///   - netHex: 16进制
    ///   - alpha: 透明度
    public static func color(netHex: Int, alpha: CGFloat) -> UIColor {
        return self.color(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, al: alpha)
    }

}
