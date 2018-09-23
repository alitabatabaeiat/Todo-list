//
//  TDTableView.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/23/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TDTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: .zero, style: style)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
