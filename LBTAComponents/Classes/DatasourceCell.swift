//
//  DatasourceCell.swift
//  Pods
//
//  Created by Brian Voong on 11/21/16.
//
//

import UIKit

open class DatasourceCell: UICollectionViewCell {
    
    open var datasourceItem: Any?
    open var controller: DatasourceController?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    open func setupViews() {
        clipsToBounds = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
