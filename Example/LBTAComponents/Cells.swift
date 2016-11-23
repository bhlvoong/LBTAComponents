//
//  Cells.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class Header: DatasourceCell {
    let textlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Collection Header"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(r: 55, g: 101, b: 220)
        addSubview(textlabel)
        textlabel.fillSuperview()
    }
}

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

class WordCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            wordlabel.text = datasourceItem as? String
        }
    }
    
    let wordlabel = UILabel()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(wordlabel)
        addSubview(dividerLineView)
        
        wordlabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        dividerLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}

class RedBoldedWordCell: WordCell {
    override func setupViews() {
        super.setupViews()
        wordlabel.font = UIFont.boldSystemFont(ofSize: 18)
        wordlabel.textColor = .red
    }
}
