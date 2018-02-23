//
//  UIImage+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/3.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

extension UIImage: HansonExtensionProtocol { }
extension HansonExtensionKit where T: UIImage {
    
    
    /// 以某种颜色创建 Image
    ///
    /// - Parameters:
    ///   - color: 指定颜色
    ///   - size: 创建的 Image 大小
    /// - Returns: 指定大小颜色的 Image
    public static func renderImageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return UIImage()
        }
        context.setFillColor(color.cgColor);
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height));
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img ?? UIImage()
    }
    
    
    /// 缩放图片到指定的尺寸
    ///
    /// - Parameter newSize: 需要缩放的尺寸
    /// - Returns: 缩放后的图片
    public func resizeImageWithNewSize(_ newSize: CGSize) -> UIImage {
        var rect = CGRect.zero
        let oldSize = wrappedValue.size
        
        if newSize.width / newSize.height > oldSize.width / oldSize.height {
            rect.size.width = newSize.height * oldSize.width / oldSize.height
            rect.size.height = newSize.height
            rect.origin.x = (newSize.width - rect.size.width) * 0.5
            rect.origin.y = 0
        } else {
            rect.size.width = newSize.width
            rect.size.height = newSize.width * oldSize.height / oldSize.width
            rect.origin.x = 0
            rect.origin.y = (newSize.height - rect.size.height) * 0.5
        }
        
        UIGraphicsBeginImageContext(newSize)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.clear.cgColor)
        UIRectFill(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        wrappedValue.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    /// 通过 View 来创建 UIImage
    ///
    /// - Parameter view: 要变成 Image 的 View
    /// - Returns: UIImage
    public static func createImageFromView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    
    /// 以原图的长宽比例作比较后，以新的Size计算出合适的裁剪范围
    ///
    /// - Parameter newSize: 裁剪后的大小
    /// - Returns: 裁剪后的图片
    public func corpImageWithSize(_ newSize: CGSize) -> UIImage {
        var rect: CGRect = CGRect.zero
        // 原图片大小
        let imageSize = wrappedValue.size
        
        // 被切图片宽比例比高比例小 或者相等，以图片宽进行放大
        if imageSize.width / imageSize.height <= newSize.width / newSize.height {
            // 以被剪裁图片的宽度为基准，得到剪切范围的大小
            rect.size.width  = newSize.width
            rect.size.height = newSize.width * imageSize.height / imageSize.width
            rect.origin.x = 0
            rect.origin.y = (newSize.height - rect.size.height) / 2
            
        } else {
            // 被切图片宽比例比高比例大，以图片高进行剪裁
            // 以被剪切图片的高度为基准，得到剪切范围的大小
            rect.size.width  = newSize.height * imageSize.width / imageSize.height
            rect.size.height = newSize.height
            
            rect.origin.x = (newSize.width - rect.size.width) / 2
            rect.origin.y = 0
        }
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return UIImage()
        }
        context.setFillColor(UIColor.clear.cgColor);
        context.fill(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        wrappedValue.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img ?? UIImage()
    }
}
