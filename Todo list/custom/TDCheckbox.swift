//
//  TDCheckbox.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/23/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDCheckbox: UIButton {
    
    var on: Bool? {
        didSet {
            if let on = self.on {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = on ? .green : .clear
                    self.setImage(on ? UIImage(named: "done-icon") : nil, for: .normal)
                }
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.grey0.cgColor
        
        self.addTarget(self, action: #selector(self.toggle), for: .touchUpInside)
    }
    
    @objc func toggle() {
        if let on = self.on {
            self.on = !on
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
