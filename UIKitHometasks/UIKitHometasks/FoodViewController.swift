//
//  FoodViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 05.10.2022.
//

import UIKit
/// экран с выбором пицца/суши
final class FoodViewController: UIViewController {
    
    // MARK: UI elements

    private let pizzaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 150, width: 370, height: 120))
        button.setTitle("Пицца", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(showNextViewController), for: .touchUpInside)
        return button
    }()
    
    private let sushiButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 350, width: 370, height: 120))
        button.setTitle("Суши", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    func configUI() {
        title = "Food"
        navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
    }
    
    // MARK: Methods
    
    @objc func showNextViewController() {
        let nextViewController = PizzaChoiceViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
