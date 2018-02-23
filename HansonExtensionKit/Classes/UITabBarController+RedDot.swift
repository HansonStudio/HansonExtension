//
//  UITabBarController+RedDot.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2018/1/24.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Foundation
fileprivate let ScreenWidth = UIScreen.main.bounds.width

extension UITabBarController: HansonExtensionProtocol {}
extension HansonExtensionKit where T: UITabBarController {
    
    public func addRedDotAtIndex(_ index: Int, radius: CGFloat = 5.0) {
        if let vcs = wrappedValue.viewControllers {
            if index >= vcs.count {
                return
            }
            let originX = ScreenWidth / CGFloat(vcs.count) * CGFloat(index)
            if let imageView = self.imageViewInView(wrappedValue.tabBar, referX: originX) {
                imageView.hsExt.addRedDot(radius)
            }
        }
    }
    
    public func clearRedDotAtIndex(_ index: Int) {
        if let vcs = wrappedValue.viewControllers {
            if index >= vcs.count {
                return
            }
            let originX = ScreenWidth / CGFloat(vcs.count) * CGFloat(index)
            if let imageView = self.imageViewInView(wrappedValue.tabBar, referX: originX) {
                imageView.hsExt.clearRedDot()
            }
        }
        
    }
    
    public func itemRectAtIndex(_ index: Int, inWindow window_: UIWindow) -> CGRect {
        if let vcs = wrappedValue.viewControllers {
            if index >= vcs.count {
                return CGRect.zero
            }
            let originX = ScreenWidth / CGFloat(vcs.count) * CGFloat(index)
            if let imageView = self.imageViewInView(wrappedValue.tabBar, referX: originX) {
                return imageView.convert(imageView.bounds, to: window_)
            }
        }
        return CGRect.zero
    }
    
    public func imageViewInView(_ theView: UIView, referX: CGFloat) -> UIImageView? {
        if theView.isKind(of: UIImageView.self) {
            let imageView = theView as! UIImageView
            let rect = imageView.superview!.convert(imageView.frame, to: wrappedValue.tabBar)
            if rect.origin.x > referX {
                return imageView
            }
        }
        for subview in theView.subviews {
            if let imageView = self.imageViewInView(subview, referX: referX) {
                return imageView
            }
        }
        return nil
    }
}
