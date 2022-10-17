//
//  VisualFormalLanguageViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 16.10.2022.
//

import UIKit

/// Экран с использованием Visual Format Language  для светофора

final class VisualFormalLanguageViewController: UIViewController {
    
    // MARK: UI Elements
    
    private lazy var rectangle = makeRectangle()
    private lazy var redSqare = makeSqare(color: UIColor.red)
    private lazy var yellowSqare = makeSqare(color: UIColor.yellow)
    private lazy var greenSqare = makeSqare(color: UIColor.green)

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Private Methods
    
    private func configUI() {
        view.backgroundColor = .white
        rectangle.addSubview(redSqare)
        rectangle.addSubview(yellowSqare)
        rectangle.addSubview(greenSqare)
        view.addSubview(rectangle)
        let viewVFL = ["redSqare": redSqare, "yellowSqare": yellowSqare,
                       "greenSqare": greenSqare, "rectangle": rectangle]
        let metrics = ["margin": 25]
        //createYellowSqareConstraint()
        //createRedSqareConstraint()
        //createGreenSqareConstraint()
        //createRectangleConstraint()
    }

}
