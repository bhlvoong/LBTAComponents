//
//  Footer.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LBTAComponents

class Footer: DatasourceCell {
    let textlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Footer"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
        addSubview(textlabel)
        textlabel.fillSuperview()
    }
}
