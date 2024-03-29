//
//  TDTextField.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/22/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDTextField: UITextField {
    
    var insets: UIEdgeInsets!
    
    init(placeholder: String = "TDTextField placeholder", backgroundColor: UIColor = .white, fontSize: CGFloat = 16, cornerRadius: CGFloat = 0, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.font = UIFont(name: "Raleway-v4020-Regular", size: fontSize)
        self.insets = insets
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
