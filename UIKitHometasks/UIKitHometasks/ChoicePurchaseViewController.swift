//
//  ChoicePurchaseViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 27.09.2022.
//

import UIKit
/// viewController для выбора покупок
class ChoicePurchaseViewController: UIViewController {
    let menuSegmentArray = ["monets", "points"]
    let imagesSegmentArray = [UIImage(named: "monets"), UIImage(named: "point")]
    var choicePurchaseSegmentControl = UISegmentedControl()
    public var monetPoint = String()
    public var amount = Int()
    var choiceAmountArray = [100, 1000, 5000, 50000, 100000]
    
    let amountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 450, width: 150, height: 30))
        label.text = "Choice amount"
        return label
    }()
    
    let amountMoneyPicker: UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 50, y: 500, width: 0, height: 0))
        return picker
    }()
    
    let choiceAmountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let monetPointImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        return imageView
    }()
    
    let enterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 800, width: 200, height: 40))
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(pushNewView), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        monetPointImageView.image = imagesSegmentArray[0]
        choicePurchaseSegmentControl = UISegmentedControl(items: menuSegmentArray)
        choicePurchaseSegmentControl.frame = CGRect(x: 60, y: 300, width: 300, height: 30)
        choicePurchaseSegmentControl.addTarget(self, action: #selector(changeSegmentValue(target:)), for: .valueChanged)
        amountMoneyPicker.delegate = self
        amountMoneyPicker.dataSource = self
        confingUI()
    }
    
    func confingUI() {
        view.addSubview(monetPointImageView)
        monetPointImageView.image = imagesSegmentArray[0]
        view.addSubview(choicePurchaseSegmentControl)
        view.addSubview(amountLabel)
        view.addSubview(amountMoneyPicker)
        enterButton.setTitle("BUY", for: .normal)
        view.addSubview(enterButton)
    }
    
    @objc func changeSegmentValue(target: UISegmentedControl) {
        if target == choicePurchaseSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            monetPointImageView.image = imagesSegmentArray[segmentIndex]
            monetPoint = menuSegmentArray[segmentIndex]
            enterButton.setTitle("BUY \(monetPoint) \(String(amount))", for: .normal)
        }
    }
    
    @objc func pushNewView() {
        let nextViewController = CongratulationsViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
extension ChoicePurchaseViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choiceAmountArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(choiceAmountArray[row])"
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        amount = choiceAmountArray[row]
        enterButton.setTitle("BUY \(monetPoint) \(String(amount))", for: .normal)
    }
}
