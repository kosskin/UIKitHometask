//
//  CongratulationsViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 27.09.2022.
//

import UIKit
/// ViewController with congratulations
class CongratulationsViewController: UIViewController {
    let grades = [1, 2, 3, 4, 5]
    
    // MARK: UI elements
    let congratulationsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 50))
        label.backgroundColor = .red
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Congratulations with buying"
        return label
    }()
    
    let gradeSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 100, y: 500, width: 200, height: 45))
        slider.maximumValue = 0
        slider.maximumValue = 5
        slider.addTarget(self, action: #selector(showAlertAction), for: .touchUpOutside)
        return slider
    }()
    
    let askGoodOrNotLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 400, width: 200, height: 30))
        label.text = "Did you like app?"
        
        return label
    }()

    // MARK: Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
    }

    // MARK: configuration UI
    func configUI() {
        view.addSubview(congratulationsLabel)
        view.addSubview(gradeSlider)
        view.addSubview(askGoodOrNotLabel)
    }
    
    // MARK: Methods
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "okay", style: .default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func showAlertAction() {
        guard gradeSlider.value > 2 else {
            alert(title: "Thanks", message: "We try do app better", style: .alert)
            return
        }
        alert(title: "Thank you", message: "We love you!", style: .alert)
    }
}
