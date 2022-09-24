//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// ViewController входа
class ViewController: UIViewController {
    
    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.layer.borderWidth = 1.5
        label.frame = CGRect(x: 112, y: 80, width: 190, height: 77)
        return label
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont(name: "Apple Symbols", size: 34)
        label.frame = CGRect(x: 44, y: 196, width: 110, height: 48)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.frame = CGRect(x: 44, y: 258, width: 42, height: 21)
        label.textColor = .systemBlue
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 44, y: 293, width: 283, height: 34)
        textField.placeholder = "examle@email.com"
        var bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.gray.cgColor
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        view.addSubview(birthdayReminderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        //view.addSubview(<#T##view: UIView##UIView#>)
    }

}
