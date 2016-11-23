//
//  ViewController.swift
//  BVBaseComponents
//
//  Created by Brian Voong on 11/16/2016.
//  Copyright (c) 2016 Brian Voong. All rights reserved.
//

import UIKit
import LBTAComponents

class WordsDatasource: Datasource {
    
    override init() {
        super.init()
        objects = ["Hello", "these", "are", "basic", "useful", "components"]
    }
    
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
        if indexPath.item % 2 == 0 {
            return WordCell.self
        } else {
            return RedBoldedWordCell.self
        }
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [WordCell.self, RedBoldedWordCell.self]
    }

    override func headerClasses() -> [AnyClass]? {
        return [Header.self]
    }

    override func footerClasses() -> [AnyClass]? {
        return [Footer.self]
    }

}

class WordsController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Basic Components & Helpers"
        collectionView?.backgroundColor = .white
        datasource = WordsDatasource()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

}

