//
//  DatasourceController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/16/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit

open class DatasourceController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    open let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        aiv.hidesWhenStopped = true
        aiv.color = .black
        return aiv
    }()
    
    open var datasource: Datasource? {
        didSet {
            if let cellClasses = datasource?.cellClasses() {
                for cellClass in cellClasses {
                    collectionView?.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
                }
            }
            
            if let headerClasses = datasource?.headerClasses() {
                for headerClass in headerClasses {
                    collectionView?.register(headerClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(headerClass))
                }
            }
            
            if let footerClasses = datasource?.footerClasses() {
                for footerClass in footerClasses {
                    collectionView?.register(footerClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footerClass))
                }
            }
            
            collectionView?.reloadData()
        }
    }
    
    public init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let defaultCellId = "defaultCellId"
    let defaultFooterId = "defaultFooterId"
    let defaultHeaderId = "defaultHeaderId"
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.alwaysBounceVertical = true
        
        layout?.minimumLineSpacing = 0
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorCenterXToSuperview()
        activityIndicatorView.anchorCenterYToSuperview()
        
        collectionView?.register(DefaultCell.self, forCellWithReuseIdentifier: defaultCellId)
        collectionView?.register(DefaultHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: defaultHeaderId)
        collectionView?.register(DefaultFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: defaultFooterId)
    }
    
    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource?.numberOfSections() ?? 0
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource?.numberOfItems(section) ?? 0
    }
    
    //need to override this otherwise size doesn't get called
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellClass: DatasourceCell.Type? = nil
        
        if let cls = datasource?.cellClass(indexPath) {
            cellClass = cls
        } else {
            let cellClasses = datasource?.cellClasses()
            if let count  = cellClasses?.count, count > indexPath.section {
                cellClass = cellClasses?[indexPath.section]
            }
        }
        
        if let cellClass = cellClass {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cellClass), for: indexPath) as! DatasourceCell
            cell.controller = self
            cell.datasourceItem = datasource?.item(indexPath)
            return cell
        }
        
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultCellId, for: indexPath) as! DatasourceCell
        defaultCell.controller = self
        defaultCell.datasourceItem = datasource?.item(indexPath)
        return defaultCell
    }
    
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView: DatasourceCell
        
        if kind == UICollectionElementKindSectionHeader {
            if let classes = datasource?.headerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DatasourceCell
                reusableView.datasourceItem = datasource?.footerItem(indexPath.section)
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultHeaderId, for: indexPath) as! DatasourceCell
            }
            
        } else {
            if let classes = datasource?.footerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DatasourceCell
                reusableView.datasourceItem = datasource?.footerItem(indexPath.section)
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultFooterId, for: indexPath) as! DatasourceCell
            }
        }
        
        reusableView.controller = self
        
        return reusableView
    }
    
    open func getRefreshControl() -> UIRefreshControl {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return rc
    }
    
    open func handleRefresh() {
        
    }
    
    open var layout: UICollectionViewFlowLayout? {
        get {
            return collectionViewLayout as? UICollectionViewFlowLayout
        }
    }
}
