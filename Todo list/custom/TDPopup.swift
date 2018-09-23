//
//  TDPopup.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/22/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDPopup: TDGradientView {
    
    let addButton = TDButton(title: "add", titleColor: .grey0, cornerRadius: 3)
    let cancelButton = TDButton(title: "cancel", titleColor: .grey0, cornerRadius: 3)
    let textField = TDTextField(placeholder: "Some Todo...", fontSize: 12, cornerRadius: 4)
    
    var delegate: TDPopupDelegate?
    
    init(cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        
        let buttonMargin: CGFloat = 12
        
        self.layer.cornerRadius = cornerRadius
        self.addSubview(addButton)
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addButton.topAnchor.constraint(equalTo: topAnchor, constant: buttonMargin).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -buttonMargin).isActive = true
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
        
        self.addSubview(cancelButton)
        cancelButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: addButton.heightAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: buttonMargin).isActive = true
        cancelButton.addTarget(self, action: #selector(self.handleCancelButton), for: .touchUpInside)
        
        self.addSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 24).isActive = true
        textField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
        textField.leftAnchor.constraint(equalTo: cancelButton.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: addButton.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addTodo(text: textFieldText)
        } else {
            print("ERROR: delegate is not provided")
        }
    }
    
    @objc func handleCancelButton() {
        self.textField.resignFirstResponder()
    }
}
