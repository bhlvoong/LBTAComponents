//
//  BasicController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import LBTAComponents

class BasicController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let words = Datasource()
        words.objects = ["Hello", "How", "are", "you", "today", "?"]
        self.datasource = words
    }
    
}
