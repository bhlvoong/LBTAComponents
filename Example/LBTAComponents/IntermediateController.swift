//
//  IntermediateController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
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

struct Device {
    let name: String
    let imageUrl: String
}

class DevicesDatasource: Datasource {
    
    override init() {
        super.init()
        let iphone7 = Device(name: "iPhone 7", imageUrl: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/1041b940-306d-4e7d-8e41-15a948a17862")
        let iphoneSE = Device(name: "iPhone SE", imageUrl: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2706cc09-6bf9-4ee2-85b5-f59752751d93")
        objects = [iphone7, iphoneSE]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [iPhoneCell.self]
    }
    
    override func headerClasses() -> [AnyClass]? {
        return [DeviceHeader.self]
    }
    
    override func headerItem(_ section: Int) -> Any? {
        return "Apple iPhones"
    }
    
}

class IntermediateController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = DevicesDatasource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
