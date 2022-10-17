//
//  NSLayoutConstraintViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 16.10.2022.
//

import UIKit

/// Экран с использованием NSLayoutConstraint для светофора
final class NSLayoutConstraintViewController: UIViewController {
    
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
        createYellowSqareConstraint()
        createRedSqareConstraint()
        createGreenSqareConstraint()
        createRectangleConstraint()
    }
    
    private func createYellowSqareConstraint() {
        NSLayoutConstraint(item: yellowSqare,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqare,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqare,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqare,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createRedSqareConstraint() {
        NSLayoutConstraint(item: redSqare,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqare,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .centerY,
                           multiplier: 0.35,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqare,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqare,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redSqare,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createGreenSqareConstraint() {
        NSLayoutConstraint(item: greenSqare,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqare,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .centerY,
                           multiplier: 1.65,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqare,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqare,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redSqare,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createRectangleConstraint() {
        NSLayoutConstraint(item: rectangle,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangle,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangle,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .height,
                           multiplier: 3.5,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangle,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSqare,
                           attribute: .width,
                           multiplier: 1.25,
                           constant: 0).isActive = true
    }
}
