//
//  UITextField+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/17.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
extension HansonExtensionKit where T == UITextField {
    
    public var notEmpty: Bool{
        get {
            return wrappedValue.text != ""
        }
    }
    
    public func validate(_ RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluate(with: wrappedValue.text)
    }
    
    public func validateEmpty() -> Bool {
        return self.validate("\\s*")
    }
    
    public func validateEmail() -> Bool {
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    
    public func validatePhoneNumber() -> Bool {
        return self.validate("^\\d{11}$")
    }
    
    public func validateAllNum() -> Bool {
        return self.validate("^\\d*$")
    }
}
