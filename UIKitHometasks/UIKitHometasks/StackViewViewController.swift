//
//  StackViewViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 16.10.2022.
//

import UIKit

/// Экран с использованием Stack View для светофора
final class StackViewViewController: UIViewController {
    
    // MARK: UI Elements
    
    private lazy var rectangle = makeRectangle()
    private lazy var lightsStackView = createStackView()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Private Methods
    
    private func configUI() {
        view.backgroundColor = .white
        view.addSubview(rectangle)
        setUpRectangle()
        view.addSubview(lightsStackView)
        setUpStackView()
    }
    
    private func createStackView() -> UIStackView {
        let redSqare = makeSqare(color: UIColor.red)
        let yellowSqare = makeSqare(color: UIColor.yellow)
        let greenSqare = makeSqare(color: UIColor.green)
        
        let stackView = UIStackView(arrangedSubviews: [redSqare, yellowSqare, greenSqare])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }
    
    private func setUpStackView() {
        lightsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lightsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lightsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        lightsStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    private func setUpRectangle() {
        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rectangle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.72).isActive = true
        rectangle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22).isActive = true
    }
}
