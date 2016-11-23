//
//  NSMutableAttributedString+Helper.swift
//  Pods
//
//  Created by Brian Voong on 11/16/16.
//
//

import Foundation

extension NSMutableAttributedString {
    public func appendNewLine() {
        append(NSAttributedString(string: "\n"))
    }
    
    public func centerAlignWithSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = lineSpacing
        
        let range = NSMakeRange(0, string.characters.count)
        addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
    }
}
