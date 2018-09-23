//
//  TDButton.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDButton: UIButton {
    
    init(title: String = "TDButton", titleColor: UIColor = .black, backgroundColor: UIColor = .white, fontSize: CGFloat = 16, cornerRadius:CGFloat = 0, imageName: String? = nil) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        if let imageName = imageName {
            setImage(UIImage(named: imageName), for: .normal)
        } else {
            self.setTitle(title, for: .normal)
            self.setTitleColor(titleColor, for: .normal)
            if let titleLabel = self.titleLabel {
                titleLabel.font = UIFont(name: "Raleway-v4020-Regular", size: fontSize)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
