//
//  UIAlertAction+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/28.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

extension HansonExtensionKit: HansonExtensionProtocol { }
extension HansonExtensionKit where T == UIAlertAction {
    
    /// Cancel Action
    static var cancel: UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    }
}
