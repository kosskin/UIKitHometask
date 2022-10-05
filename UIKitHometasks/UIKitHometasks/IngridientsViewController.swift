//
//  IngridientsViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 05.10.2022.
//

import UIKit

// Протокол для перехода на экран с RootViewController
protocol PopToRootDelegate: AnyObject {
    func goToRootViewController()
}

/// экран с выбором ингридиентов
final class IngridientsViewController: UIViewController {
    
        private let pizzaLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 119, y: 50, width: 200, height: 30)
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.textColor = .systemGray
            return label
        }()

        private let pizzaUIImage: UIImageView = {
            let image = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
            return image
        }()

        private let cheeseLabel: UILabel = {
            let cheese = UILabel()
            cheese.text = "Сыр мацарелла"
            cheese.textColor = .systemGray
            cheese.frame = CGRect(x: 20, y: 500, width: 200, height: 30)
            return cheese
        }()

        private let cheeseSwitch: UISwitch = {
            let cheese = UISwitch()
            cheese.frame = CGRect(x: 300, y: 500, width: 30, height: 30)
            return cheese
        }()

        private let hamLabel: UILabel = {
            let ham = UILabel()
            ham.text = "Ветчина"
            ham.textColor = .systemGray
            ham.frame = CGRect(x: 20, y: 550, width: 200, height: 30)
            return ham
        }()

        private let hamSwitch: UISwitch = {
            let ham = UISwitch()
            ham.frame = CGRect(x: 300, y: 550, width: 30, height: 30)
            return ham
        }()

        private let mashroomLabel: UILabel = {
            let mashroom = UILabel()
            mashroom.text = "Грибы"
            mashroom.textColor = .systemGray
            mashroom.frame = CGRect(x: 20, y: 600, width: 200, height: 30)
            return mashroom
        }()

        private let mashroomSwitch: UISwitch = {
            let mashroom = UISwitch()
            mashroom.frame = CGRect(x: 300, y: 600, width: 30, height: 30)
            return mashroom
        }()

        private let oliveLabel: UILabel = {
            let olive = UILabel()
            olive.text = "Маслины"
            olive.textColor = .systemGray
            olive.frame = CGRect(x: 20, y: 650, width: 200, height: 30)
            return olive
        }()

        private let oliveSwitch: UISwitch = {
            let olive = UISwitch()
            olive.frame = CGRect(x: 300, y: 650, width: 30, height: 30)
            return olive
        }()

        private var chooseButton: UIButton = {
            let button = UIButton()
            button.setTitle("Выбрать", for: .normal)
            button.backgroundColor = .systemOrange
            button.layer.cornerRadius = 15
            button.frame = CGRect(x: 70, y: 700, width: 250, height: 50)
            button.addTarget(self, action: #selector(presentCheckVCAction), for: .touchUpInside)
            return button
        }()
    
    // MARK: Public properties
    var pizza = ""
    var pizzaPicture = ""
    var ingridients = ""

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        view.backgroundColor = .white
        pizzaLabel.text = pizza
        view.addSubview(pizzaLabel)
        pizzaUIImage.image = UIImage(named: pizzaPicture)
        view.addSubview(pizzaUIImage)
        view.addSubview(cheeseLabel)
        view.addSubview(cheeseSwitch)
        view.addSubview(hamLabel)
        view.addSubview(hamSwitch)
        view.addSubview(mashroomLabel)
        view.addSubview(mashroomSwitch)
        view.addSubview(oliveLabel)
        view.addSubview(oliveSwitch)
        view.addSubview(chooseButton)
    }
    
    // MARK: Methods
    
    @objc func presentCheckVCAction() {
        let checkViewController = CheckViewController()
        let navigationControllerTwo = UINavigationController(rootViewController: checkViewController)
        checkViewController.pizzaLabel.text = pizza
        checkViewController.title = "Оплата"
        addIngridientsAction()
        checkViewController.ingridientsLabel.text = ingridients
        navigationControllerTwo.modalPresentationStyle = .fullScreen
        checkViewController.delegate = self
        present(navigationControllerTwo, animated: false, completion: nil)
    }
    
    func addIngridientsAction() {
        if cheeseSwitch.isOn == true {
            ingridients += "Сыр моцарелла\n"
        }
        if hamSwitch.isOn == true {
            ingridients += "Ветчина\n"
        }
        if mashroomSwitch.isOn == true {
            ingridients += "Грибы\n"
        }
        if oliveSwitch.isOn == true {
            ingridients += "Маслины\n"
        }
    }
}

// расширение для перехода на экран выбора пицца/суши
extension IngridientsViewController: PopToRootDelegate {
    func goToRootViewController() {
        if let navigationViewControllerOne = self.presentingViewController as? UINavigationController {
            self.view.isHidden = true
            dismiss(animated: false)
            navigationViewControllerOne.popToRootViewController(animated: false)
        }

    }
}
