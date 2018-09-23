//
//  TDTableViewCell.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/23/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDTableViewCell: UITableViewCell {
    
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
                print(todo.status)
                checkbox.on = todo.status
                titleLabel.text = todo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let rowsSpace: CGFloat = 6
        let sideInset: CGFloat = 12
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: rowsSpace / 2).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(rowsSpace / 2)).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        view.addSubview(checkbox)
        checkbox.widthAnchor.constraint(equalToConstant: 18).isActive = true
        checkbox.heightAnchor.constraint(equalTo: checkbox.widthAnchor).isActive = true
        checkbox.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -sideInset).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: sideInset).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: checkbox.leftAnchor).isActive = true
        titleLabel.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
