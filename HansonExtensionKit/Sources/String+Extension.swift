//
//  String+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/12/19.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation
import CommonCrypto

extension String: HansonExtensionProtocol { }
extension HansonExtensionKit where T == String {
    
    public func MD5String() -> String {
        let cStr = wrappedValue.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    public var toMd5HexCode : String {
        let str = wrappedValue.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(wrappedValue.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        return String(format: hash as String)
    }
    
    
    // MARK: -
    
    public func validate(_ RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluate(with: wrappedValue)
    }
    
    public func validateNickname() -> Bool {
        return self.validate("^.{3,30}$")
    }
    
    public func validateAllNum() -> Bool {
        return self.validate("^\\d*$")
    }
    
    public func validatePhoneNum() -> Bool {
        return self.validate("^\\d{11}$")
    }
    
    public func validatePassword() -> Bool {
        return self.validate("^[A-Z0-9a-z]{6,20}")
    }
    
    public func validateEmail() -> Bool {
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    
    // MARK: -
    //48-57num  65-90A 97-122a
    
    public func allNumber() -> Bool {
        if let asciiString = wrappedValue.cString(using: String.Encoding.ascii) {
            for v in 0 ..< asciiString.count - 1 {
                if !(asciiString[v] >= 48 && asciiString[v] <= 57) {
                    return false
                }
            }
            return true
        } else {
            return true
        }
    }
    
    public func allLetter() -> Bool {
        if let asciiString = wrappedValue.cString(using: String.Encoding.ascii) {
            for v in 0 ..< asciiString.count - 1 {
                if !((asciiString[v] >= 65 && asciiString[v] <= 90) || (asciiString[v] >= 97 && asciiString[v] <= 122)) {
                    return false
                }
            }
            return true
        } else {
            return true
        }
    }
}
