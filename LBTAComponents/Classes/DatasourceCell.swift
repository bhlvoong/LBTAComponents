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
    open weak var controller: DatasourceController?
    
    open let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        lineView.isHidden = true
        return lineView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    open func setupViews() {
        clipsToBounds = true
        addSubview(separatorLineView)
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
        
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
