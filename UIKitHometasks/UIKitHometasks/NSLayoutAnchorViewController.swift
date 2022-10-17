//
//  NSLayoutAnchorViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 16.10.2022.
//

import UIKit

/// Экран с использованием NSLayoutAnchor для светофора
final class NSLayoutAnchorViewController: UIViewController {
    
    // MARK: UI Elements
    
    private lazy var rectangle = makeRectangle()
    private lazy var redSqare = makeSqare(color: UIColor.red)
    private lazy var yellowSqare = makeSqare(color: UIColor.yellow)
    private lazy var greenSqare = makeSqare(color: UIColor.green)

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        rectangle.addSubview(redSqare)
        rectangle.addSubview(yellowSqare)
        rectangle.addSubview(greenSqare)
        view.addSubview(rectangle)
        configUI()
    }
    
    // MARK: Private Methods
    
    private func configUI() {
        view.backgroundColor = .white
        createYellowConstraint()
        createRedConstraint()
        createGreenConstraint()
        createRectangleConstraint()
    }
    
    private func createYellowConstraint() {
        yellowSqare.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowSqare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowSqare.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        yellowSqare.widthAnchor.constraint(equalTo: yellowSqare.heightAnchor).isActive = true
    }
    
    private func createRedConstraint() {
        redSqare.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redSqare.centerYAnchor.anchorWithOffset(to: yellowSqare.centerYAnchor)
            .constraint(equalTo: yellowSqare.heightAnchor, multiplier: 1.12).isActive = true
        redSqare.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        redSqare.widthAnchor.constraint(equalTo: redSqare.heightAnchor).isActive = true
    }
    
    private func createGreenConstraint() {
        greenSqare.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenSqare.centerYAnchor.anchorWithOffset(to: yellowSqare.centerYAnchor)
            .constraint(equalTo: yellowSqare.heightAnchor, multiplier: -1.12).isActive = true
        greenSqare.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        greenSqare.widthAnchor.constraint(equalTo: greenSqare.heightAnchor).isActive = true
    }
    
    private func createRectangleConstraint() {
        rectangle.centerXAnchor.constraint(equalTo: yellowSqare.centerXAnchor).isActive = true
        rectangle.centerYAnchor.constraint(equalTo: yellowSqare.centerYAnchor).isActive = true
        rectangle.heightAnchor.constraint(equalTo: yellowSqare.heightAnchor, multiplier: 3.5).isActive = true
        rectangle.widthAnchor.constraint(equalTo: yellowSqare.widthAnchor, multiplier: 1.25).isActive = true
    }
}
