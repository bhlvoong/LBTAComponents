//
//  BaseButton.swift
//  Pods
//
//  Created by Brian Voong on 11/22/16.
//
//

import UIKit

open class LBTAButton: UIButton {
    
    public init(_ title: String?, image: UIImage? = nil, touchUpHandler: (() ->())? = nil) {
        super.init(frame: .zero)
        self.touchUpHandler = touchUpHandler
        self.addTarget(self, action: #selector(touchUpSelector), for: .touchUpInside)
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
    }
    
    func touchUpSelector() {
        touchUpHandler?()
    }
    
    private var touchUpHandler: (() -> ())?
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
