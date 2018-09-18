//
//  TDLabel.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDLabel: UILabel {
    
    init(frame: CGRect = .zero, text: String = "Label", textColor: UIColor = .white, fontSize: CGFloat = 16, textAlignment:NSTextAlignment = .left) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name: "Raleway-v4020-Regular", size: fontSize)
        self.textAlignment = textAlignment
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
