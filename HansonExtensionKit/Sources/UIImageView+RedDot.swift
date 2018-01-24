//
//  UIImageView+RedDot.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2018/1/24.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Foundation
// MARK: - UIImage 上添加红点(可配合UITabBarController+RedDot使用)

extension UIImageView: HansonExtensionProtocol {}
extension HansonExtensionKit where T: UIImageView {
    
    public func redDot() -> UIView? {
        return wrappedValue.viewWithTag(9999)
    }
    
    public func addRedDot(_ radius: CGFloat) {
        if let _ = wrappedValue.viewWithTag(9999) {
            return
        }
        let dotRadius: CGFloat = radius
        let redDot = UIView()
        redDot.layer.cornerRadius = dotRadius
        redDot.tag = 9999
        redDot.backgroundColor = UIColor.red
        wrappedValue.addSubview(redDot)
        wrappedValue.clipsToBounds = false
        redDot.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: redDot, attribute: .top, relatedBy: .equal, toItem: wrappedValue, attribute: .top, multiplier: 1.0, constant: -1.5)
        let rightConstraint = NSLayoutConstraint(item: redDot, attribute: .right, relatedBy: .equal, toItem: wrappedValue, attribute: .right, multiplier: 1.0, constant: 1.5 + (dotRadius - 2.5) * 2.0)
        let hConstraint = NSLayoutConstraint(item: redDot, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: dotRadius * 2)
        let wConstraint = NSLayoutConstraint(item: redDot, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: dotRadius * 2)
        wrappedValue.addConstraints([topConstraint, rightConstraint, hConstraint, wConstraint])
    }
    
    public func addRedDot() {
        addRedDot(2.5)
    }
    
    public func clearRedDot() {
        if let dot = wrappedValue.viewWithTag(9999) {
            dot.removeFromSuperview()
        }
    }
}
