//
//  CheckViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 05.10.2022.
//

import UIKit
/// экран с чеком
final class CheckViewController: UIViewController {
    
    // MARK: UIelements
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 150, width: 200, height: 40)
        return label
    }()

    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 200, width: 200, height: 40)
        return label
    }()

    var ingridientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = """
"""
        label.numberOfLines = 5
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 250, width: 300, height: 200)
        return label
    }()

    let cardLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 90, y: 600, width: 200, height: 30)
        return label
    }()

    let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "Наличными"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 90, y: 650, width: 200, height: 30)
        return label
    }()

    lazy var cardSwitch: UISwitch = {
        let cardSwitch = UISwitch()
        cardSwitch.isOn = true
        cardSwitch.frame = CGRect(x: 290, y: 600, width: 30, height: 30)
        cardSwitch.addTarget(self, action: #selector(cardSwitchCheckAction), for: .valueChanged)
        return cardSwitch
    }()

    lazy var cashSwitch: UISwitch = {
        let cashSwitch = UISwitch()
        cashSwitch.frame = CGRect(x: 290, y: 650, width: 30, height: 30)
        cashSwitch.addTarget(self, action: #selector(cashSwitchCheckAction), for: .valueChanged)
        return cashSwitch
    }()

    lazy var payButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 70, y: 700, width: 250, height: 50)
        button.layer.cornerRadius = 15
        button.setTitle("\u{F8FF} Pay", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(orderAlertAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Public property
    
    weak var delegate: PopToRootVC?
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        view.backgroundColor = .white
        view.addSubview(pizzaLabel)
        view.addSubview(ingridientsLabel)
        view.addSubview(orderLabel)
        view.addSubview(cardLabel)
        view.addSubview(cashLabel)
        view.addSubview(cardSwitch)
        view.addSubview(cashSwitch)
        view.addSubview(payButton)
        if cardSwitch.isOn {
            cashSwitch.isOn = false
            cardSwitch.isOn = true
        } else {
            cardSwitch.isOn = false
            cashSwitch.isOn = true
        }
    }
    
    // MARK: Methods
    
    @objc func orderAlertAction() {
        let orderAlertController = UIAlertController(title: "Заказ оплачен!",
                                                     message: """
Ваш заказ доставят в течение 15 минут!
 Приятного аппетита!
""",
                                                     preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "ok", style: .default) { _ in
            self.dismiss(animated: false, completion: nil)
            self.delegate?.goToRootViewController()
        }
        orderAlertController.addAction(alertOK)
        present(orderAlertController, animated: false, completion: nil)
    }
    
    @objc func cardSwitchCheckAction() {
        if cardSwitch.isOn {
            cashSwitch.isOn = false
        }
    }
    
    @objc func cashSwitchCheckAction() {
        if cashSwitch.isOn {
            cardSwitch.isOn = false
        }
    }
    
}
