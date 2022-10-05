//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// экран с полями входа (для ввода логина и пароля)
final class SignInViewController: UIViewController {
    
    // MARK: UI elements
    private let cloudImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 80, width: 150, height: 70))
        imageView.image = UIImage(systemName: "cloud.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let textOnCloudLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 175, y: 95, width: 100, height: 50))
        label.text = "Bringo"
        label.textColor = .systemBlue
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 280, width: 100, height: 24))
        label.text = "Email"
        label.textColor = .systemBlue
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 310, width: 300, height: 24))
        textField.placeholder = "example@mail.ru"
        textField.font = .italicSystemFont(ofSize: 12)
        textField.keyboardType = .numberPad
        return textField
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 370, width: 100, height: 24))
        label.text = "Password"
        label.textColor = .systemBlue
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    private let passwodrTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 390, width: 300, height: 24))
        textField.placeholder = "password"
        textField.font = .italicSystemFont(ofSize: 12)
        return textField
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 40))
        button.backgroundColor = .systemBlue
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showNextViewController), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    func configUI() {
        view.backgroundColor = .white
        view.addSubview(cloudImageView)
        view.addSubview(textOnCloudLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwodrTextField)
        view.addSubview(enterButton)
    }
    
    // MARK: Methods
    
    @objc func showNextViewController() {
        let foodViewController = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodViewController)
        foodViewController.title = "Food"
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: false, completion: nil)
    }
}
