//
//  TDHeaderView.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/22/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDHeaderView: TDGradientView {
    
    let titleLabel = TDLabel(fontSize: 14)
    let subtitleLabel = TDLabel(fontSize: 24)
    let addButton = TDButton(title: "+", fontSize: 24, type: [.text, .icon])
    var delegate: TDHeaderViewDelegate?
    
    init(header title: String = "Header Title", subtitle: String = "Subtitle") {
        super.init(frame: .zero)
        
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        self.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        self.addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        self.addSubview(addButton)
        addButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor).isActive = true
        addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -(20 + 8)).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.addTodo()
        } else {
            print("ERROR: delegate is not provided")
        }
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

protocol TDHeaderViewDelegate {
    func addTodo()
}