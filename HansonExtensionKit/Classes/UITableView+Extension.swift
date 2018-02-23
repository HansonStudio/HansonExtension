//
//  UITableView+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/23.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
extension HansonExtensionKit where T: UITableView {
    
    /// 自动布局 HeaderView
    ///
    /// - Parameter header: HeaderView
    public func setAndLayoutTableHeaderView(header: UIView) {
        wrappedValue.tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        header.frame.size = header.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        wrappedValue.tableHeaderView = header
    }
}
