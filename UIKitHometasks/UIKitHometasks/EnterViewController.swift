//
//  EnterViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 04.10.2022.
//

import UIKit
/// экран входа
final class EnterViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private let defaults = UserDefaults.standard
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultsSet()
    }
    
    private func defaultsSet() {
        defaults.set(1, forKey: "email")
        defaults.set(1, forKey: "password")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "app" {
            guard let login = loginTextField.text,
                  let password = passwordTextField.text,
                  login == String(defaults.integer(forKey: "email")),
                  password == String(defaults.integer(forKey: "password")) else { return false }
            performSegue(withIdentifier: "app", sender: nil)
            return true
        }
        return true
    }
}
