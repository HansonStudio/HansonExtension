//
//  UIApplication+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/9.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication: HansonExtensionProtocol { }
extension HansonExtensionKit where T == UIApplication {
    
    /// 获取当前正在展示的`ViewController`
    ///
    /// - Parameter rootController: 指定root controller
    /// - Returns: 正在展示的`ViewController`
    public static func presentedViewController(rootController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = rootController as? UINavigationController {
            return presentedViewController(rootController: navigationController.visibleViewController)
        }
        
        if let tabBarController = rootController as? UITabBarController {
            if let selectedController = tabBarController.selectedViewController {
                return presentedViewController(rootController: selectedController)
            }
        }
        
        if let presented = rootController?.presentedViewController {
            return presentedViewController(rootController: presented)
        }
        
        return rootController
    }
}
