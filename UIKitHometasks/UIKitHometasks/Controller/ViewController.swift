//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// Главный ViewController
class ViewController: UIViewController {

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.textColor = .green
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.center = CGPoint(x: 300, y: 300)
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(getAlert), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        return button
    }()
    
    var modelHello = HelloModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButton)
        view.addSubview(mainLabel)
    }
    
    @objc func getAlert() {
        let alertController = UIAlertController(title: "", message: "message", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { _ in
            guard let inputText = alertController.textFields?.first?.text else {
                return
            }
            self.mainLabel.text = self.modelHello.toHello(message: inputText)
        }
        alertController.addTextField { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
