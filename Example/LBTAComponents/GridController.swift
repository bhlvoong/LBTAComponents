//
//  GridController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class GridCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            backgroundColor = datasourceItem as? UIColor
        }
    }
}

class GridDatasource: Datasource {
    
    override init() {
        super.init()
        let colors: [UIColor] = [.red, .green, .blue, .orange, .purple, .black, .yellow, .cyan, .brown, .lightGray]
        objects = colors
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [GridCell.self]
    }
    
}

class GridController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout?.minimumInteritemSpacing = 10
        layout?.minimumLineSpacing = 10
        layout?.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        datasource = GridDatasource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 10 * 4) / 3
        return CGSize(width: width, height: width)
    }
    
}
