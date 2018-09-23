//
//  ButtonOptions.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/22/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int
    
    static let rounded = ButtonOptions(rawValue: 1 << 0)
    static let text = ButtonOptions(rawValue: 1 << 1)
    static let icon = ButtonOptions(rawValue: 1 << 2)
}
