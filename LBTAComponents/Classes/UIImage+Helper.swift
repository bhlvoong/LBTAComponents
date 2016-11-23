//
//  UIImage+Helper.swift
//  Pods
//
//  Created by Brian Voong on 11/16/16.
//
//

import Foundation

extension UIImage {
    public static func getWindowImage() -> UIImage? {
        if let keyWindow = UIApplication.shared.keyWindow {
            UIGraphicsBeginImageContextWithOptions(keyWindow.frame.size, keyWindow.isOpaque, 0)
            keyWindow.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
}
