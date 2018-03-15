//
//  UIColorExtensions.swift
//  siemensctitp
//
//  Created by Paul Kraft on 10.06.17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience public init?(hexString: String) {
        guard let rgbValue = UInt64(hexString, radix: 0x10) else { return nil }
        switch hexString.count {
        case 6: self.init(withoutAlpha: rgbValue)
        case 8: self.init(withAlpha: rgbValue)
        default: return nil
        }
    }
    
    convenience public init(withoutAlpha rgbValue: UInt64) {
        self.init(
            red:    CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:   CGFloat((rgbValue & 0x0000FF) >>  0) / 255.0,
            alpha:  1.0
        )
    }
    
    convenience public init(withAlpha rgbValue: UInt64) {
        self.init(
            red:    CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
            blue:   CGFloat((rgbValue & 0x0000FF00) >>  8) / 255.0,
            alpha:  CGFloat((rgbValue & 0x000000FF) >>  0) / 255.0
        )
    }
    
}

