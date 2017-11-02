//
//  Hanson.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/2.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

public protocol HansonCompatible {
    associatedtype CompatibleType
    var hs: CompatibleType { get }
    static var hs: CompatibleType.Type { get }
}

public extension HansonCompatible {
    var hs: HansonExtensionKit<Self> {
        return HansonExtensionKit(value: self)
    }
    
    static var hs: HansonExtensionKit<Self>.Type {
        return HansonExtensionKit.self
    }
}

public struct HansonExtensionKit<T> {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
