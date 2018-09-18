//
//  ViewController.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/17/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let background: UIView = {
        let view = TDGradientView()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    let titleLabel = TDLabel(text: "GET IT DONE", fontSize: 24, textAlignment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(background)
        
        background.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        background.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
        background.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 24).isActive = true
    }


}

