//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// ViewController с полями входа (для ввода логина и пароля)
class SignInViewController: UIViewController {
    
    // MARK: UI elements
    private let cloudImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 80, width: 100, height: 50))
        imageView.image = UIImage(systemName: "cloud.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 24))
        label.text = "Email"
        label.textColor = .systemBlue
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 230, width: 300, height: 24))
        textField.placeholder = "example@mail.ru"
        textField.font = .italicSystemFont(ofSize: 12)
        return textField
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 260, width: 100, height: 24))
        label.text = "Password"
        label.textColor = .systemBlue
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    private let passwodrTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 290, width: 300, height: 24))
        textField.placeholder = "password"
        textField.font = .italicSystemFont(ofSize: 12)
        return textField
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 350, width: 200, height: 40))
        button.backgroundColor = .systemBlue
        return button
    }()
    
    // MARK: Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    func configUI() {
        view.addSubview(cloudImage)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwodrTextField)
        view.addSubview(enterButton)
    }
}
