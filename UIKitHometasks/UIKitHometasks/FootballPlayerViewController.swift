//
//  FootballPlayerViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 04.10.2022.
//

import UIKit
/// экран с выбором футболиста и его рейтингом
final class FootballPlayerViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var listFootballersPickerView: UIPickerView!
    @IBOutlet weak var footballerInfoLabel: UILabel!
    @IBOutlet weak var showInfoLabel: UILabel!
    @IBOutlet weak var showInfoSwitch: UISwitch!
    
    // MARK: Constants
    
    private enum Constants {
        static let playerArray = ["Ronaldo",
                                "Messi", "Koskin", "Kalachev", "Zidan", "Pele"]
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listFootballersPickerView.dataSource = self
        listFootballersPickerView.delegate = self
    }
    
    // MARK: IBActions
    
    @IBAction func showInfoAction(_ sender: UISwitch) {
        footballerInfoLabel.isHidden = sender.isOn ? false : true
    }
    
    // MARK: Methods
    
    private func showAlertAction() {
        let badProgrammerAlertController = UIAlertController(title: "Это отличный футболист!",
            message: "Жаль, что пока хреновый программист", preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "Ок, в Done", style: .default, handler: nil)
        badProgrammerAlertController.addAction(alertOK)
        present(badProgrammerAlertController, animated: true, completion: nil)
    }
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource

extension FootballPlayerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.playerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Constants.playerArray[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 90"
        case 1:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 80"
        case 2:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 99. Also he is a programmer"
            showAlertAction()
        case 3:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 89"
        case 4:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 91"
        case 5:
            footballerInfoLabel.text = "It is \(Constants.playerArray[row]). His rating is 92"
        default:
            break
        }
    }
}
