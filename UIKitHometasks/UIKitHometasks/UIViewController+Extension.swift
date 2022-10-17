//
//  UIViewController+Extension.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 16.10.2022.
//

import UIKit

/// Расширение для добавления элементов на вью
extension UIViewController {
    func makeSqare(color: UIColor) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
    func makeRectangle() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 750, height: 250))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }
}
