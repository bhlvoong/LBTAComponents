//
//  IntermediateMultipleSectionController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class IntermediateMixedController: DatasourceController {
    
    class MixedDevicesDatasource: Datasource {
        override init() {
            super.init()
            let iphone7 = Device(name: "iPhone 7", imageUrl: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/1041b940-306d-4e7d-8e41-15a948a17862")
            let iphoneSE = Device(name: "iPhone SE", imageUrl: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2706cc09-6bf9-4ee2-85b5-f59752751d93")
            let phones = [iphone7, iphoneSE]
            let macBookPro = Device(name: "MacBook Pro 2016", imageUrl: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6d8e328a-b6e2-4082-8a40-a420fdf62023")
            let macs = [macBookPro]
            objects = [phones, macs, [iphone7, iphoneSE, macBookPro]]
        }
        
        override func numberOfSections() -> Int {
            return objects?.count ?? 0
        }
        
        override func numberOfItems(_ section: Int) -> Int {
            let devices = objects?[section] as? [Device]
            return devices?.count ?? 0
        }
        
        override func item(_ indexPath: IndexPath) -> Any? {
            let devices = objects?[indexPath.section] as? [Device]
            return devices?[indexPath.item]
        }
        
        override func cellClasses() -> [DatasourceCell.Type] {
            return [iPhoneCell.self, MacCell.self]
        }
        
        override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
            if indexPath.section == 0 {
                return iPhoneCell.self
            } else if indexPath.section == 1 {
                return MacCell.self
            } else {
                let devices = objects?[indexPath.section] as! [Device]
                let device = devices[indexPath.item]
                if device.name.contains("iPhone") {
                    return iPhoneCell.self
                }
                return MacCell.self
            }
        }
        
        override func headerClasses() -> [DatasourceCell.Type]? {
            return [DeviceHeader.self]
        }
        
        override func headerItem(_ section: Int) -> Any? {
            if section == 0 {
                return "Apple iPhones"
            } else if section == 1 {
                return "MacBook Computers"
            }
            return "Mix of Phones and Computers"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Intermediate"
        
        datasource = MixedDevicesDatasource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
