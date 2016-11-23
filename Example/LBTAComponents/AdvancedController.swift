//
//  AdvancedController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

struct App {
    let name: String
    let imageUrl: String
}

class AppCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .lightGray
        addSubview(nameLabel)
        nameLabel.fillSuperview()
    }
    
}

class AppCategory: Datasource {
    let name: String
    let apps: [App]
    
    init(name: String, apps: [App]) {
        self.name = name
        self.apps = apps
        super.init()
        self.objects = apps
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return apps[indexPath.item].name
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AppCell.self]
    }
}

class AppsController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.alwaysBounceVertical = false
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 10
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: view.frame.height)
    }
}

class AppCategoryCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            appsController.datasource = datasourceItem as? AppCategory
        }
    }
    
    let appsController = AppsController()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(appsController.view)
        appsController.view.fillSuperview()
    }
    
}

class AdvancedDatasource: Datasource {
    
    override init() {
        super.init()
        
        let spotify = App(name: "Spotify", imageUrl: "")
        let pandora = App(name: "Pandora", imageUrl: "")
        let soundCloud = App(name: "SoundCloud", imageUrl: "")
        let appleMusic = App(name: "Apple Music", imageUrl: "")
        
        let twitter = App(name: "Twitter", imageUrl: "")
        let facebook = App(name: "Facebook", imageUrl: "")
        let googlePlus = App(name: "Google Plus", imageUrl: "")
        
        let musicCategory = AppCategory(name: "Music", apps: [spotify, pandora, soundCloud, appleMusic])
        let socialCategory = AppCategory(name: "Social", apps: [twitter, facebook, googlePlus])
        
        objects = [musicCategory, socialCategory]
    }
    
    override func numberOfSections() -> Int {
        return objects?.count ?? 0
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return objects?[indexPath.section]
    }
    
    override func headerItem(_ section: Int) -> Any? {
        let category = objects?[section] as? AppCategory
        return category?.name
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AppCategoryCell.self]
    }
    
}

class AdvancedController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = AdvancedDatasource()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
