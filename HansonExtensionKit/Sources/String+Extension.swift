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
}
