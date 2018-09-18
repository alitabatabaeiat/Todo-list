//
//  UIColor.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

extension UIColor {

    static var blue0: UIColor { return UIColor(rgb: 0x64E4FF) }
    static var blue1: UIColor { return UIColor(rgb: 0x3A7BD5) }
    static var grey0: UIColor { return UIColor(rgb: 0x9B9B9B) }
    static var grey1: UIColor { return UIColor(rgb: 0x424242) }

    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
