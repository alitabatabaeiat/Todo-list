//
//  TDLabel.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDLabel: UILabel {
    
    var insets: UIEdgeInsets!
    
    init(frame: CGRect = .zero, text: String = "TDLabel", textColor: UIColor = .white, fontSize: CGFloat = 16, textAlignment:NSTextAlignment = .left, cornerRadius: CGFloat = 0) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name: "Raleway-v4020-Regular", size: fontSize)
        self.textAlignment = textAlignment
        self.clipsToBounds = cornerRadius > 0
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
