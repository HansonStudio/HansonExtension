//
//  Identifer+Extension.swift
//  HansonExtensionKit
//
//  Created by Hanson on 2018/1/4.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Foundation
import UIKit

// MARK: Identifiable Protocol

// 类唯一标识
protocol Identifiable: class {
    static var identifier: String { get }
}

// 返回自身类名
extension Identifiable where Self: NSObject {
    static var identifier: String { return String(describing: self) }
}

extension UITableViewCell: Identifiable {}
extension UITableViewHeaderFooterView: Identifiable {}
extension UICollectionReusableView: Identifiable {}


// MARK: - UITableView

extension HansonExtensionKit where T: UITableView {
    
    func register<T: UITableViewCell>(_ CellReuseClassType: T.Type) {
        wrappedValue.register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ ReuseClassType: T.Type) {
        wrappedValue.register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = wrappedValue.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue cell")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let headerfooter = wrappedValue.dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("cannot dequeue headerfooter")
        }
        return headerfooter
    }
}


// MARK: - UICollectionView

extension HansonExtensionKit where T: UICollectionView {
    
    func register<T: UICollectionViewCell>(_ CellReuseClassType: T.Type) {
        wrappedValue.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func register<T: UICollectionReusableView>(_ CellReuseClassType: T.Type, forSupplementaryViewOfKind kind: String) {
        wrappedValue.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = wrappedValue.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue cell")
        }
        
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath) -> T {
        guard let view = wrappedValue.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue SupplementaryView")
        }
        
        return view
    }
}

