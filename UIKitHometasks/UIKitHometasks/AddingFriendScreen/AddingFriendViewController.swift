//
//  AddingFriendViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 25.09.2022.
//

import UIKit

/// ViewController для экрана с добавлением друга в birthdayList
class AddingFriendViewController: UIViewController {
    
    private let possibleAges = Array(18...60)
    private let manWoman = ["Парень", "Девушка"]
    
    let contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.frame = CGRect(x: 130, y: 119, width: 155, height: 155)
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    let changePhotoProfile: UILabel = {
        let label = UILabel()
        label.text = "Изменить фото"
        label.textAlignment = .center
        label.frame = CGRect(x: 113, y: 280, width: 188, height: 21)
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 325, width: 34, height: 21))
        label.text = "Имя"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 35, y: 355, width: 340, height: 21))
        textField.placeholder = "Введите имя"
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height + 3, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 395, width: 34, height: 21))
        label.text = "Дата"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 35, y: 425, width: 340, height: 21))
        textField.placeholder = "Введите дату"
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height + 3, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        picker.locale = Locale(identifier: "en_GB")
        return picker
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 465, width: 104, height: 21))
        label.text = "Возраст"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 35, y: 495, width: 340, height: 21))
        textField.placeholder = "Добавить"
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height + 3, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        return textField
    }()

    let selectAgePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
        
    let sexLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 535, width: 34, height: 21))
        label.text = "Пол"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let sexTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 35, y: 565, width: 340, height: 21))
        textField.placeholder = "Добавить"
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height + 3, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let selectSexPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 2
        return picker
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 605, width: 104, height: 21))
        label.text = "Instagram"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let instagramTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 35, y: 635, width: 340, height: 21))
        textField.placeholder = "Добавить"
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: textField.frame.height + 3, width: textField.frame.width, height: 1.0)
        textField.layer.addSublayer(bottom)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        textField.addTarget(self, action: #selector(getAlertInstagram), for: .allEvents)
        return textField
    }()
    
    let instagramAlert: UIAlertController = {
        let alert = UIAlertController()
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .done, target: nil, action: nil)
    }

    func configUI() {
        view.backgroundColor = .white
        view.addSubview(contactImageView)
        view.addSubview(changePhotoProfile)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(sexLabel)
        view.addSubview(sexTextField)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
        
        ageTextField.inputView = selectAgePicker
        selectAgePicker.dataSource = self
        selectAgePicker.delegate = self
        
        sexTextField.inputView = selectSexPicker
        selectSexPicker.dataSource = self
        selectSexPicker.delegate = self
        
    }
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func doneButtonAction() {
        dateTextField.text = "\(datePicker.date)"
        view.endEditing(true)
    }
    
    @objc func getAlertInstagram() {
        let alertController = UIAlertController(title: "Введите username Instagram",
                                                message: "", preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "Ok",
                                        style: .default, handler: nil)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(alertActionOk)
        alertController.addAction(alertActionCancel)
        alertController.addTextField(configurationHandler: nil)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension AddingFriendViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return possibleAges.count
        case 2:
            return manWoman.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return String(possibleAges[row])
        case 2:
            return String(manWoman[row])
        default:
            return "nil"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = String(possibleAges[row])
            ageTextField.resignFirstResponder()
        case 2:
            sexTextField.text = String(manWoman[row])
            sexTextField.resignFirstResponder()
        default:
            break
        }
    }
    
}
