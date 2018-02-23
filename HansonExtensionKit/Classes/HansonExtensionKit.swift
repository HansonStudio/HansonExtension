//
//  Hanson.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2017/11/2.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import Foundation

public protocol HansonExtensionProtocol {
    associatedtype CompatibleType
    var hsExt: CompatibleType { get }
    static var hsExt: CompatibleType.Type { get }
}

public extension HansonExtensionProtocol {
    var hsExt: HansonExtensionKit<Self> {
        return HansonExtensionKit(value: self)
    }
    
    static var hsExt: HansonExtensionKit<Self>.Type {
        return HansonExtensionKit.self
    }
}

public struct HansonExtensionKit<T> {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
