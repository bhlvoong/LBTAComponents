//
//  DevicesDatasource.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class IntermediateDatasource: Datasource {
    
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
