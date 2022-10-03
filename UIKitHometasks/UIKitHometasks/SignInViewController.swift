//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// экран регистрации
class SignInViewController: UIViewController, UITextFieldDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var haveAccountButton: UIButton!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        view.backgroundColor = .white
        loginTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        //loginTextField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.x = 0.0
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.x = 0.0
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case loginTextField:
            loginTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            repeatPasswordTextField.becomeFirstResponder()
        case repeatPasswordTextField:
            repeatPasswordTextField.resignFirstResponder()
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            loginTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            repeatPasswordTextField.becomeFirstResponder()
        case repeatPasswordTextField:
            repeatPasswordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
