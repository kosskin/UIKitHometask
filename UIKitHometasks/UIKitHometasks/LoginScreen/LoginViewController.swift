//
//  LoginViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 23.09.2022.
//

import UIKit

/// Экран входа
class LoginViewController: UIViewController {
    
    let cloudView: UIImageView = {
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
    
    let passLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemPink
        passwordLabel.font = UIFont(name: "System", size: 17)
        return passwordLabel
    }()
    
    let passTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "example@mail.ru"
        passwordTextField.layer.borderWidth = 0.2
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let goButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = UIColor.systemPink
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.addTarget(self, action: #selector(loginButtonTouch), for: .touchUpInside)
        return enterButton
    }()
    
//    let regButton: UIButton = {
//        let signUpButton = UIButton()
//        signUpButton.translatesAutoresizingMaskIntoConstraints = false
//        signUpButton.setTitle("Регистрация", for: .normal)
//        signUpButton.backgroundColor = UIColor.white
//        signUpButton.setTitleColor(.black, for: .normal)
//        signUpButton.addTarget(self, action: #selector(signUpButtonTouch), for: .touchUpInside)
//        return signUpButton
//    }()
    
    let namePassStackView: UIStackView = {
        let logPasStackView = UIStackView()
        logPasStackView.translatesAutoresizingMaskIntoConstraints = false
        logPasStackView.axis = .vertical
        logPasStackView.alignment = .fill
        return logPasStackView
    }()
    
    var getLogin: String? {
        return nameTextField.text
    }
    
    var getPassword: String? {
        return passTextField.text
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setConstraints()
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func configUI() {
        view.backgroundColor = .white
        namePassStackView.addArrangedSubview(nameLabel)
        namePassStackView.addArrangedSubview(nameTextField)
        namePassStackView.addArrangedSubview(passLabel)
        namePassStackView.addArrangedSubview(passTextField)
        view.addSubview(cloudView)
        view.addSubview(signInLabel)
        view.addSubview(namePassStackView)
        view.addSubview(goButton)
//        view.addSubview(regButton)
    }
    
    func setConstraints() {
        cloudView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cloudView.widthAnchor.constraint(equalToConstant: 195).isActive = true
        cloudView.heightAnchor.constraint(equalToConstant: 99.5).isActive = true
        cloudView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 59).isActive = true
        signInLabel.topAnchor.constraint(equalTo: cloudView.bottomAnchor, constant: 50.5).isActive = true
        
        namePassStackView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 35).isActive = true
        namePassStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        namePassStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        goButton.widthAnchor.constraint(equalToConstant: 314).isActive = true
        goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goButton.topAnchor.constraint(equalTo: namePassStackView.bottomAnchor, constant: 76).isActive = true

//        regButton.widthAnchor.constraint(equalToConstant: 314).isActive = true
//        regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        regButton.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 28).isActive = true
    }
    
//    @objc func signUpButtonTouch() {
//        guard let login = getLogin,
//              let password = getPassword else {
//            return
//        }
//        presenter?.tapSignUpButton(login: login, password: password)
//    }
//
    @objc func loginButtonTouch() {
        let nextVC = OrderViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
