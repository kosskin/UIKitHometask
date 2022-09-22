//
//  MainView.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//

import UIKit
/// Main class
class MainView: UIView {

    private let mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.textColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(mainLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
