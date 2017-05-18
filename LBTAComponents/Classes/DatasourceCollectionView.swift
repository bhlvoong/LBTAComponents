//
//  DatasourceCollectionView.swift
//  Pods
//
//  Created by Yanstar Studio on 18/05/2017.
//
//

import UIKit

open class DatasourceCollectionView: UICollectionView, UICollectionViewDataSource {
    
    let defaultCellId = "lbta_defaultCellId"
    let defaultFooterId = "lbta_defaultFooterId"
    let defaultHeaderId = "lbta_defaultHeaderId"
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
        
        register(DefaultCell.self, forCellWithReuseIdentifier: defaultCellId)
        register(DefaultHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: defaultHeaderId)
        register(DefaultFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: defaultFooterId)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var datasource: Datasource? {
        didSet {
            if let cellClasses = datasource?.cellClasses() {
                for cellClass in cellClasses {
                    register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
                }
            }
            
            if let headerClasses = datasource?.headerClasses() {
                for headerClass in headerClasses {
                    register(headerClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(headerClass))
                }
            }
            
            if let footerClasses = datasource?.footerClasses() {
                for footerClass in footerClasses {
                    register(footerClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footerClass))
                }
            }
            self.dataSource = self
            self.reloadData()
        }
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource?.numberOfSections() ?? 0
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource?.numberOfItems(section) ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DatasourceCell
        
        if let cls = datasource?.cellClass(indexPath) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DatasourceCell
        } else if let cellClasses = datasource?.cellClasses(), cellClasses.count > indexPath.section {
            let cls = cellClasses[indexPath.section]
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DatasourceCell
        } else if let cls = datasource?.cellClasses().first {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DatasourceCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultCellId, for: indexPath) as! DatasourceCell
        }
        
        cell.collectionView = self
        cell.datasourceItem = datasource?.item(indexPath)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: DatasourceCell
        
        if kind == UICollectionElementKindSectionHeader {
            if let classes = datasource?.headerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DatasourceCell
            } else if let cls = datasource?.headerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DatasourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultHeaderId, for: indexPath) as! DatasourceCell
            }
            reusableView.datasourceItem = datasource?.headerItem(indexPath.section)
            
        } else {
            if let classes = datasource?.footerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DatasourceCell
            } else if let cls = datasource?.footerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DatasourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultFooterId, for: indexPath) as! DatasourceCell
            }
            reusableView.datasourceItem = datasource?.footerItem(indexPath.section)
        }
        
        reusableView.collectionView = self
        return reusableView
    }
}
