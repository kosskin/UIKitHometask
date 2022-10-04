//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit
/// экран входа
final class SignInViewController: UIViewController {
    
    // MARK: UI elements
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "fifa23")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let signInLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign In"
            label.textColor = .red
            label.font = UIFont(name: "Apple Symbols", size: 40)
            label.frame = CGRect(x: 44, y: 216, width: 110, height: 48)
            return label
        }()

        private let emailLabel: UILabel = {
            let label = UILabel()
            label.text = "Email"
            label.font = .boldSystemFont(ofSize: 16)
            label.frame = CGRect(x: 44, y: 278, width: 42, height: 21)
            label.textColor = .red
            return label
        }()

        private let emailTextField: UITextField = {
            let textField = UITextField()
            textField.frame = CGRect(x: 44, y: 313, width: 283, height: 34)
            textField.placeholder = "examle@email.com"
            let bottom = CALayer()
            bottom.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
            textField.layer.addSublayer(bottom)
            bottom.backgroundColor = UIColor.black.cgColor
            return textField
        }()

        private let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "Password"
            label.font = .boldSystemFont(ofSize: 16)
            label.frame = CGRect(x: 44, y: 386, width: 84, height: 21)
            label.textColor = .red
            return label
        }()

        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.frame = CGRect(x: 44, y: 422, width: 283, height: 34)
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
            let bottom = CALayer()
            bottom.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
            textField.layer.addSublayer(bottom)
            bottom.backgroundColor = UIColor.black.cgColor
            return textField
        }()

        private let eyeButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.frame = CGRect(x: 278, y: 434, width: 34, height: 18)
            button.tintColor = .lightGray
            button.addTarget(self, action: #selector(eyeButtonAction(sender:)), for: .touchUpInside)
            return button
        }()
        private let faceIDLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 122, y: 517, width: 148, height: 21)
            label.textColor = .red
            label.text = "Вход по Face ID"
            return label
        }()

        private let faceIDSwitch: UISwitch = {
            let switcher = UISwitch()
            switcher.frame = CGRect(x: 278, y: 512, width: 0, height: 0)
            switcher.isOn = true
            return switcher
        }()

        private let enterButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 42, y: 641, width: 330, height: 47)
            button.backgroundColor = .red
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Войти", for: .normal)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(enterButtonAction(sender:)), for: .touchUpInside)
            return button
        }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(enterButton)
        view.addSubview(eyeButton)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Methods
    
    @objc func eyeButtonAction(sender: UIButton) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }

    @objc func enterButtonAction(sender: UIButton) {
        let choicePurchaseVC = ChoicePurchaseViewController()
        navigationController?.pushViewController(choicePurchaseVC, animated: true)
    }
}
