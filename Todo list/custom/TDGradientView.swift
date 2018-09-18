//
//  TDGradientView.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDGradientView: UIView {

    let colors = [
        UIColor.blue0.cgColor,
        UIColor.blue1.cgColor
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = self.colors
            layer.locations = [0, 1.2]
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
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
