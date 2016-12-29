//
//  BasicDatasource.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class BasicDatasource: Datasource {
    
    override init() {
        super.init()
        objects = ["Hello", "these", "are", "basic", "useful", "components"]
    }
    
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
        if indexPath.item % 2 == 0 {
            return WordCell.self
        } else {
            return RedBoldedWordCell.self
        }
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [WordCell.self, RedBoldedWordCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [Header.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [Footer.self]
    }
    
}
