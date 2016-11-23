//
//  UIImageView+Cache.swift
//  streamapp
//
//  Created by Brian Voong on 7/29/16.
//  Copyright © 2016 luxeradio. All rights reserved.
//

import UIKit

open class CachedImageView: UIImageView {
    
    open static let imageCache = NSCache<NSString, UIImage>()
    
    open var shouldUseEmptyImage = true
    
    private var urlStringForChecking: String?
    private var emptyImage: UIImage?
    
    public init(_ cornerRadius: CGFloat = 0, emptyImage: UIImage? = nil) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        self.emptyImage = emptyImage
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func loadImageForUrlString(_ urlString: String, completion: (() -> ())? = nil) {
        image = nil
        
        self.urlStringForChecking = urlString
        
        let urlKey = urlString as NSString
        
        if let cachedImage = CachedImageView.imageCache.object(forKey: urlKey) {
            image = cachedImage
            completion?()
            return
        }
        
        guard let url = URL(string: urlString) else {
            if shouldUseEmptyImage {
                image = emptyImage
            }
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    CachedImageView.imageCache.setObject(image, forKey: urlKey)
                    
                    if urlString == self?.urlStringForChecking {
                        self?.image = image
                        completion?()
                    }
                }
            }
            
            }) .resume()
    }
}
