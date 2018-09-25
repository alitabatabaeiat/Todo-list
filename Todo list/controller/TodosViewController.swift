//
//  TodosViewController.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController, TDPopupDelegate {
    
    let headerView = TDHeaderView(header: "Stuff to get done", subtitle: "4 left")
    lazy var tableBackground: UIView = {
        let view = TDGradientView()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = tableViewInset
        
        return view
    }()
    let tableView = TDTableView()
    let addTodoPopup = TDPopup(popupHeight: addTodoPopupHeight, popupY: addTodoPopupHeight - 10,cornerRadius: 14)
    
    var tableBackgroundBottomConstraint: NSLayoutConstraint!
    let tableViewInset:CGFloat = 16
    var todos = [Todo]()
    let CELL_ID = "cell_id"
    static var addTodoPopupHeight: CGFloat = 100
    var keyboardHeight: CGFloat = 330

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        openAddTodoPopup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(tableBackground)
        tableBackground.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        tableBackground.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        tableBackground.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        tableBackgroundBottomConstraint = tableBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        tableBackgroundBottomConstraint.isActive = true
        
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: tableBackground.leftAnchor, constant: tableViewInset).isActive = true
        tableView.rightAnchor.constraint(equalTo: tableBackground.rightAnchor, constant: -tableViewInset).isActive = true
        tableView.topAnchor.constraint(equalTo: tableBackground.topAnchor, constant: tableViewInset).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tableBackground.bottomAnchor, constant: -tableViewInset).isActive = true
        
        view.addSubview(addTodoPopup)
        addTodoPopup.heightAnchor.constraint(equalToConstant: TodosViewController.addTodoPopupHeight).isActive = true
        addTodoPopup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        addTodoPopup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        addTodoPopup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        headerView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        addTodoPopup.textField.delegate = self
        addTodoPopup.delegate = self
        
        tableView.register(TDTableViewCell.self, forCellReuseIdentifier: CELL_ID)
        
        todos.append(Todo(id: 0, title: "First Item", status: false))
        todos.append(Todo(id: 1, title: "Second Item", status: false))
        todos.append(Todo(id: 2, title: "Third Item", status: true))
        
        updateTodosLeft()
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
    }
    
    func updateTodosLeft() {
        headerView.todosLeft = 0
        todos.forEach { (todo) in
            if !todo.status { headerView.todosLeft += 1 }
        }
    }
}

extension TodosViewController: TDHeaderViewDelegate, UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableBackgroundBottomConstraint.constant -= keyboardHeight
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.addTodoPopup.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }) { (_) in
            self.addTodoPopup.cancelDelay = 0.25
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        tableBackgroundBottomConstraint.constant += keyboardHeight
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.addTodoPopup.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (_) in
            self.addTodoPopup.cancelDelay = 0
        }
    }
    
    func openAddTodoPopup() {
        addTodoPopup.animate()
    }
    
    func addTodo(text: String) {
        if text != "" && !todoExists(title: text) {
            let newTodo = Todo(id: todos.count, title: text, status: false)
            todos.append(newTodo)
            tableView.reloadData()
            addTodoPopup.textField.text = ""
            addTodoPopup.animate(delay: addTodoPopup.cancelDelay)
        }
    }

    func todoExists(title: String) -> Bool {
        for todo in todos {
            if todo.title == title {
                return true
            }
        }
        return false
    }
}

extension TodosViewController: UITableViewDelegate, UITableViewDataSource, TDTableViewCellDelegate {
    
    func checkboxDidToggled(updatedTodo todo: Todo) {
        for i in 0..<todos.count {
            if todos[i].id == todo.id {
                todos[i] = todo
                break
            }
        }
        tableView.reloadData()
        updateTodosLeft()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerTitle = TDLabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 36), textColor: .white, fontSize: 20)
        if section == 0 {
            headerTitle.text = "Todo"
        } else {
            headerTitle.text = "Done"
        }
        return headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        todos.forEach { (todo) in
            if section == 0 && !todo.status {
                count += 1
            } else if section == 1 && todo.status {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! TDTableViewCell
        cell.delegate = self
        
        var counter = 0
        for todo in todos {
            if indexPath.section == 0 && !todo.status {
                if counter == indexPath.row {
                    cell.todo = todo
                    break
                }
                counter += 1
            } else if indexPath.section == 1 && todo.status {
                if counter == indexPath.row {
                    cell.todo = todo
                    break
                }
                counter += 1
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
