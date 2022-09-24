//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// ViewController  с кнопкой Start
class StartViewController: UIViewController {

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        label.center = CGPoint(x: 205, y: 300)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(transformToHelloAlert), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        return button
    }()
    
    let storage = Storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButton)
        view.addSubview(mainLabel)
    }
    
    @objc func transformToHelloAlert() {
        let alertController = UIAlertController(title: "", message: "message", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .default) { _ in
            guard let inputText = alertController.textFields?.first?.text else {
                return
            }
            self.mainLabel.text = self.storage.toHello(message: inputText)
        }
        alertController.addTextField { _ in
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
