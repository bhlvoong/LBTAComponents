//
//  DeviceCells.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class DeviceHeader: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let text = datasourceItem as? String else { return }
            label.text = text
        }
    }
    
    let label = UILabel()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .lightGray
        label.textAlignment = .center
        addSubview(label)
        label.fillSuperview()
    }
}

class iPhoneCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let device = datasourceItem as? Device else { return }
            imageView.loadImage(urlString: device.imageUrl)
            nameLabel.text = device.name
        }
    }
    
    let imageView = CachedImageView()
    
    let nameLabel = UILabel()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.contentMode = .scaleAspectFit
        imageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 0, widthConstant: 80, heightConstant: 0)
        
        nameLabel.anchor(topAnchor, left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class MacCell: iPhoneCell {
    override func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 12, rightConstant: 12, widthConstant: 80, heightConstant: 0)
        
        nameLabel.textAlignment = .right
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: imageView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}
