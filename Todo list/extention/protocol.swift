//
//  protocol.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/23/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import Foundation

protocol TDHeaderViewDelegate {
    func openAddTodoPopup()
}

protocol TDPopupDelegate {
    func addTodo(text: String)
    func editTodo(withId id: Int32, text: String)
}

protocol TDTableViewCellDelegate {
    func checkboxDidToggled(todo: Todo)
}
