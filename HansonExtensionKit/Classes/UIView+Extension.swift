//
//  UIView+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/10.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
extension UIView: HansonExtensionProtocol {}
extension HansonExtensionKit where T == UIView {
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    public func maskCorner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: wrappedValue.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = wrappedValue.bounds
        maskLayer.path = maskPath.cgPath
        wrappedValue.layer.mask = maskLayer
    }
}
