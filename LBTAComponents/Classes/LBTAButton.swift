//
//  BaseButton.swift
//  Pods
//
//  Created by Brian Voong on 11/22/16.
//
//

import UIKit

open class LBTAButton: UIButton {
    
    public init(title: String?, image: UIImage? = nil, font: UIFont? = nil, titleColor: UIColor = .black, touchUpHandler: (() ->())? = nil) {
        super.init(frame: .zero)
        self.touchUpHandler = touchUpHandler
        self.addTarget(self, action: #selector(touchUpSelector), for: .touchUpInside)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.font = font
    }
    
    func touchUpSelector() {
        touchUpHandler?()
    }
    
    private var touchUpHandler: (() -> ())?
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
