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
    
    private lazy var rectangleView = makeRectangle()
    private lazy var redSqareView = makeSqare(color: UIColor.red)
    private lazy var yellowSqareView = makeSqare(color: UIColor.yellow)
    private lazy var greenSqareView = makeSqare(color: UIColor.green)

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Private Methods
    
    private func configUI() {
        view.backgroundColor = .white
        rectangleView.addSubview(redSqareView)
        rectangleView.addSubview(yellowSqareView)
        rectangleView.addSubview(greenSqareView)
        view.addSubview(rectangleView)
        createYellowConstraints()
        createRedConstraints()
        createGreenConstraints()
        createRectangleConstraints()
    }
    
    private func createYellowConstraints() {
        yellowSqareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowSqareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowSqareView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        yellowSqareView.widthAnchor.constraint(equalTo: yellowSqareView.heightAnchor).isActive = true
    }
    
    private func createRedConstraints() {
        redSqareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redSqareView.centerYAnchor.anchorWithOffset(to: yellowSqareView.centerYAnchor)
            .constraint(equalTo: yellowSqareView.heightAnchor, multiplier: 1.12).isActive = true
        redSqareView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        redSqareView.widthAnchor.constraint(equalTo: redSqareView.heightAnchor).isActive = true
    }
    
    private func createGreenConstraints() {
        greenSqareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenSqareView.centerYAnchor.anchorWithOffset(to: yellowSqareView.centerYAnchor)
            .constraint(equalTo: yellowSqareView.heightAnchor, multiplier: -1.12).isActive = true
        greenSqareView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        greenSqareView.widthAnchor.constraint(equalTo: greenSqareView.heightAnchor).isActive = true
    }
    
    private func createRectangleConstraints() {
        rectangleView.centerXAnchor.constraint(equalTo: yellowSqareView.centerXAnchor).isActive = true
        rectangleView.centerYAnchor.constraint(equalTo: yellowSqareView.centerYAnchor).isActive = true
        rectangleView.heightAnchor.constraint(equalTo: yellowSqareView.heightAnchor, multiplier: 3.5).isActive = true
        rectangleView.widthAnchor.constraint(equalTo: yellowSqareView.widthAnchor, multiplier: 1.25).isActive = true
    }
}
