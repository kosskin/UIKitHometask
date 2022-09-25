//
//  BirthdayListViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 24.09.2022.
//

import UIKit

///BirthdayListViewController - отвечает за список людей с их др
class BirthdayListViewController: UIViewController {
    
    private let jeremyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 82, y: 127, width: 61, height: 21)
        label.text = "Jeremy"
        return label
    }()
    
    private let jeremyDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.frame = CGRect(x: 82, y: 156, width: 234, height: 21)
        label.text = "10 марта, в среду исполнится 25 лет"
        label.textColor = .gray
        return label
    }()
    
    private let jeremyDaysLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = CGRect(x: 324, y: 140, width: 70, height: 21)
        label.text = "18 дней"
        label.textColor = .gray
        return label
    }()
    
    private let jeremyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.frame = CGRect(x: 8, y: 118, width: 66, height: 66)
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let mariaNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 82, y: 195, width: 61, height: 21)
        label.text = "Maria Lui"
        return label
    }()
    
    private let mariaDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.frame = CGRect(x: 82, y: 224, width: 234, height: 21)
        label.text = "30 марта, в четверг исполнится 25 лет"
        label.textColor = .gray
        return label
    }()
    
    private let mariaDaysLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = CGRect(x: 324, y: 208, width: 70, height: 21)
        label.text = "28 дней"
        label.textColor = .gray
        return label
    }()
    
    private let mariaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.frame = CGRect(x: 8, y: 186, width: 66, height: 66)
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let jonyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 82, y: 266, width: 61, height: 21)
        label.text = "Jony Stark"
        return label
    }()
    
    private let jonyDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.frame = CGRect(x: 82, y: 294, width: 234, height: 21)
        label.text = "20 апреля, в субботу исполнится 25 лет"
        label.textColor = .gray
        return label
    }()
    
    private let jonyDaysLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = CGRect(x: 324, y: 278, width: 70, height: 21)
        label.text = "53 дней"
        label.textColor = .gray
        return label
    }()
    
    private let jonyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.frame = CGRect(x: 8, y: 256, width: 66, height: 66)
        imageView.tintColor = .gray
        return imageView
    }()
    
//    private let plusButtonItem: UIBarButtonItem = {
//        let buttomItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(pushNewView))
//        return buttomItem
//    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configuUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(pushNewView))
    }
    
    func configuUI() {
        view.backgroundColor = .white
        view.addSubview(jeremyNameLabel)
        view.addSubview(jeremyDescriptionLabel)
        view.addSubview(jeremyDaysLabel)
        view.addSubview(jeremyImage)
        view.addSubview(mariaNameLabel)
        view.addSubview(mariaDescriptionLabel)
        view.addSubview(mariaDaysLabel)
        view.addSubview(mariaImage)
        view.addSubview(jonyNameLabel)
        view.addSubview(jonyDescriptionLabel)
        view.addSubview(jonyDaysLabel)
        view.addSubview(jonyImage)
    }

    @objc func pushNewView() {
        let nextViewController = AddingFriendViewController()
        present(nextViewController, animated: true, completion: nil)
    }
}
