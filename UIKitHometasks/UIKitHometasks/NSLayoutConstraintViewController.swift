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
        createYellowSqareConstraints()
        createRedSqareConstraints()
        createGreenSqareConstraints()
        createRectangleConstraints()
    }
    
    private func createYellowSqareConstraints() {
        NSLayoutConstraint(item: yellowSqareView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqareView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqareView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSqareView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createRedSqareConstraints() {
        NSLayoutConstraint(item: redSqareView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqareView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .centerY,
                           multiplier: 0.35,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqareView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSqareView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redSqareView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createGreenSqareConstraints() {
        NSLayoutConstraint(item: greenSqareView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqareView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .centerY,
                           multiplier: 1.65,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqareView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.25,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSqareView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redSqareView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createRectangleConstraints() {
        NSLayoutConstraint(item: rectangleView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangleView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangleView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .height,
                           multiplier: 3.5,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: rectangleView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSqareView,
                           attribute: .width,
                           multiplier: 1.25,
                           constant: 0).isActive = true
    }
}
