//
//  LBTATextView.swift
//  Pods
//
//  Created by Brian Voong on 11/28/16.
//
//

import UIKit

open class LBTATextView: UITextView {
    
    public init() {
        super.init(frame: .zero, textContainer: nil)
        backgroundColor = .clear
        isEditable = false
        isScrollEnabled = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
