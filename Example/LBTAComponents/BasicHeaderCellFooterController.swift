//
//  ViewController.swift
//  BVBaseComponents
//
//  Created by Brian Voong on 11/16/2016.
//  Copyright (c) 2016 Brian Voong. All rights reserved.
//

import UIKit
import LBTAComponents

class BasicHeaderCellFooterController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Basic"
        collectionView?.backgroundColor = .white
        datasource = BasicDatasource()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

}

