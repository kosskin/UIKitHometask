//
//  LoginViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 23.09.2022.
//

import UIKit

/// Экран входа в приложение
class LoginViewController: UIViewController {
    
    let cloudViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "cloud.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    let signInLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.text = "Sign In"
        mainLabel.font = UIFont(name: "Apple Symbols", size: 34)
        return mainLabel
    }()
    
    let nameLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Email"
        loginLabel.textColor = .systemPink
        loginLabel.font = UIFont(name: "System", size: 17)
        return loginLabel
    }()
    
    let nameTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.placeholder = "example@mail.ru"
        loginTextField.layer.borderWidth = 0.2
        return loginTextField
    }()
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemPink
        passwordLabel.font = UIFont(name: "System", size: 17)
        return passwordLabel
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "example@mail.ru"
        passwordTextField.layer.borderWidth = 0.2
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = UIColor.systemPink
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return enterButton
    }()
    
    let namePasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setConstraints()
    }
    
    func configUI() {
        view.backgroundColor = .white
        namePasswordStackView.addArrangedSubview(nameLabel)
        namePasswordStackView.addArrangedSubview(nameTextField)
        namePasswordStackView.addArrangedSubview(passwordLabel)
        namePasswordStackView.addArrangedSubview(passwordTextField)
        view.addSubview(cloudViewImage)
        view.addSubview(signInLabel)
        view.addSubview(namePasswordStackView)
        view.addSubview(enterButton)
    }
    
    func setConstraints() {
        cloudViewImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cloudViewImage.widthAnchor.constraint(equalToConstant: 195).isActive = true
        cloudViewImage.heightAnchor.constraint(equalToConstant: 99.5).isActive = true
        cloudViewImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 59).isActive = true
        signInLabel.topAnchor.constraint(equalTo: cloudViewImage.bottomAnchor, constant: 50.5).isActive = true
        
        namePasswordStackView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 35).isActive = true
        namePasswordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        namePasswordStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        enterButton.widthAnchor.constraint(equalToConstant: 314).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.topAnchor.constraint(equalTo: namePasswordStackView.bottomAnchor, constant: 76).isActive = true
    }
    
    @objc func loginButtonAction() {
        let nextVC = OrderViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
