//
//  BillViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 23.09.2022.
//

import UIKit

/// BillViewController - экран со счетом
class BillViewController: UIViewController {

    let firstFoodTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Салат цезарь"
        return textField
    }()
    
    let secondFoodTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Салат греческий"
        return textField
    }()
    
    let firstFoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "400"
        return label
    }()
    
    let secondFoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "400"
        return label
    }()
    
    let resultButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Итого: 800 рублей", for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        view.addSubview(firstFoodTextField)
        view.addSubview(firstFoodLabel)
        view.addSubview(secondFoodTextField)
        view.addSubview(secondFoodLabel)
        view.addSubview(resultButton)
        title = "Чек"
    }
    
    func setConstraints() {
        firstFoodTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        firstFoodTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstFoodTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: 103).isActive = true
        
        firstFoodLabel.centerYAnchor.constraint(equalTo: firstFoodTextField.centerYAnchor).isActive = true
        firstFoodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        secondFoodTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        secondFoodTextField.topAnchor.constraint(equalTo: firstFoodTextField.bottomAnchor, constant: 52).isActive = true
        secondFoodTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        secondFoodLabel.centerYAnchor.constraint(equalTo: secondFoodTextField.centerYAnchor).isActive = true
        secondFoodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        resultButton.topAnchor.constraint(equalTo: secondFoodTextField.bottomAnchor, constant: 263).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        resultButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
}
