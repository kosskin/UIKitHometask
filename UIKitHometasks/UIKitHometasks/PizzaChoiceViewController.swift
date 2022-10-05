//
//  PizzaChoiceViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 05.10.2022.
//

import UIKit
/// экран выбора пиццы
final class PizzaChoiceViewController: UIViewController {
    
    private let peperoniImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 30, y: 150, width: 100, height: 100))
        imageView.image = UIImage(named: "pizza")
        return imageView
    }()
    
    private let margaritaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 30, y: 300, width: 100, height: 100))
        imageView.image = UIImage(named: "pizzaMargarita")
        return imageView
    }()
    
    private let peperoniLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 190, width: 100, height: 20))
        label.text = "Пепперони"
        return label
    }()
    
    private let margaritaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 340, width: 100, height: 20))
        label.text = "Маргарита"
        return label
    }()
    
    private let peperoniPlusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 330, y: 188, width: 30, height: 30))
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(pizzaSelectAction), for: .touchUpInside)
        return button
    }()
    
    private let margarutaPlusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 330, y: 338, width: 30, height: 30))
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(pizzaSelectAction), for: .touchUpInside)
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
        title = "Pizza"
        view.addSubview(peperoniImageView)
        view.addSubview(margaritaImageView)
        view.addSubview(peperoniLabel)
        view.addSubview(margaritaLabel)
        view.addSubview(peperoniPlusButton)
        view.addSubview(margarutaPlusButton)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    // MARK: Methods
    
    @objc func pizzaSelectAction() {
        let ingridientsViewController = IngridientsViewController()
        if margarutaPlusButton.isTouchInside {
            ingridientsViewController.pizza = "Маргарита"
            ingridientsViewController.pizzaPicture = "pizzaMargarita"
            ingridientsViewController.modalPresentationStyle = .formSheet
            ingridientsViewController.title = "Ingridients"
            self.present(ingridientsViewController, animated: false, completion: nil)
        } else {
            ingridientsViewController.pizza = "Пепперони"
            ingridientsViewController.pizzaPicture = "pizza"
            ingridientsViewController.modalPresentationStyle = .formSheet
            ingridientsViewController.title = "Ingridients"
            self.present(ingridientsViewController, animated: false, completion: nil)
        }
    }
}
