//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// экран для приветствия
final class WelcomeViewController: UIViewController {
    
    // MARK: UI elements

    private let helloLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        label.text = "Добро пожаловать в читальную"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .brown
        return label
    }()
    
    private let booksImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 140, width: 370, height: 400))
        imageView.image = UIImage(named: "books")
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let startReadButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 660, width: 370, height: 80))
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Перейти к чтению", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(showNextAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        view.backgroundColor = .white
        view.addSubview(helloLabel)
        navigationController?.isNavigationBarHidden = true
        helloLabel.center.x = view.center.x
        view.addSubview(booksImageView)
        view.addSubview(startReadButton)
    }
    
    // MARK: Methods
    
    @objc private func showNextAction() {
        let nextViewController = ReaderViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
