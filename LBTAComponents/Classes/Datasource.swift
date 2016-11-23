//
//  Datasource.swift
//  Pods
//
//  Created by Brian Voong on 11/21/16.
//
//

import Foundation

open class Datasource: NSObject {
    
    public var objects: [Any]?
    
    open func cellClasses() -> [DatasourceCell.Type] {
        return []
    }
    
    open func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
        return nil
    }
    
    open func headerClasses() -> [AnyClass] {
        return []
    }
    
    open func footerClasses() -> [AnyClass] {
        return []
    }
    
    open func numberOfItems(section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    open func numberOfSections() -> Int {
        return 1
    }
    
    open func item(indexPath: IndexPath) -> Any? {
        return objects?[indexPath.item]
    }
    
    open func headerItem(indexPath: IndexPath) -> Any? {
        return nil
    }
    
}
