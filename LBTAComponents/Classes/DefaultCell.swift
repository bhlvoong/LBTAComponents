//
//  DefaultCell.swift
//  Pods
//
//  Created by Brian Voong on 11/22/16.
//
//

import UIKit

class DefaultCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            if let text = datasourceItem as? String {
                label.text = text
            } else {
                label.text = datasourceItem.debugDescription
            }
        }
    }
    
    let label = UILabel()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        label.fillSuperview()
    }
    
}
