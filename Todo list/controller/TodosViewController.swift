//
//  TodosViewController.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/18/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController {
    
    let headerView = TDHeaderView(header: "Stuff to get done", subtitle: "4 left")
    let addTodoPopup = TDPopup(cornerRadius: 14)
    
    var keyboardHeight: CGFloat = 330

    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        view.addSubview(addTodoPopup)
        addTodoPopup.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addTodoPopup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        addTodoPopup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        addTodoPopup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        headerView.delegate = self
        addTodoPopup.textField.delegate = self
        addTodoPopup.delegate = self
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
    }
}

extension TodosViewController: TDHeaderViewDelegate, UITextFieldDelegate, TDPopupDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.addTodoPopup.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.addTodoPopup.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }
    
    func openAddTodoPopup() {
        print("addTodo")
    }
    
    func addTodo(text: String) {
        print(text)
    }
}
