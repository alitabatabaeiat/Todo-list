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
        view.layer.cornerRadius = 24
        
        return view
    }()
    
    let titleLabel = TDLabel(text: "GET IT DONE", fontSize: 24, textAlignment: .center)
    let infoLabel:UILabel = {
        let label = TDLabel(text: "Welcome this is my Todo list app.\nEnjoy the app :)", fontSize: 14, textAlignment: .center)
        label.numberOfLines = 2
        return label
    }()
    
    let startButton: UIButton = {
        let button = TDButton(title: "START", titleColor: .grey0, cornerRadius: 20, type: [.rounded, .text])
        button.addTarget(self, action: #selector(handleStartButton(_:)), for: .touchUpInside)
        return button
    }()
    
    let copyrightLabel = TDLabel(text: "© 2018 | Ali Tabatabaei", textColor: .grey1, fontSize: 12, textAlignment: .center)
    
    @objc func handleStartButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.12, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            button.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.23, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                button.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                self.present(TodosViewController(), animated: true, completion: nil)
            }
        }
    }

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
        
        background.addSubview(infoLabel)
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        
        background.addSubview(startButton)
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        startButton.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -60).isActive = true
        
        view.addSubview(copyrightLabel)
        copyrightLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }


}

