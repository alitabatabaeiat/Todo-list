//
//  TDTableViewCell.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/23/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDTableViewCell: UITableViewCell {
    
    var delegate: TDTableViewCellDelegate?
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    let titleLabel = TDLabel(textColor: .grey0)
    let checkbox = TDCheckbox()
    
    var todo: Todo? {
        didSet {
            if let todo = self.todo {
                checkbox.on = todo.status
                titleLabel.text = todo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let rowsSpace: CGFloat = 6
        let inCellSideInset: CGFloat = 12
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: rowsSpace / 2).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(rowsSpace / 2)).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        view.addSubview(checkbox)
        checkbox.widthAnchor.constraint(equalToConstant: 22).isActive = true
        checkbox.heightAnchor.constraint(equalTo: checkbox.widthAnchor).isActive = true
        checkbox.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inCellSideInset).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inCellSideInset).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: checkbox.leftAnchor).isActive = true
        titleLabel.backgroundColor = .white
        
        checkbox.addTarget(self, action: #selector(self.toggle), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toggle() {
        if let todo = self.todo, let delegate = self.delegate {
            delegate.checkboxDidToggled(todo: todo)
        }
    }

}
