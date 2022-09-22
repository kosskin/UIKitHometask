//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//

import UIKit
/// controller
class ViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.alertName(title: "Готов к игре?", message: "Введите имя", style: .alert)
    }

    @IBAction func plusButton(_ sender: UIButton) {
        alertSum(title: "Играем!", message: "Введи 2 числа", style: .alert)
    }
    
    @IBAction func guessNumberButton(_ sender: UIButton) {
        alertGuessNumber(tittle: "Играем!", message: "Загадал от 1 до 3", style: .alert)
    }
    
    func alertName(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Давай!", style: .default) { _ in
            let text = alertController.textFields?.first
            guard let notOptName = text?.text else { return }
            
            if notOptName.isEmpty {
                self.hiLabel.text = "Начинаем, незнакомец?"
            } else {
                self.hiLabel.text = "Начинаем, \(notOptName)?"
            }
        }
        
        alertController.addTextField { _ in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertSum(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { _ in
        }
        
        alertController.addTextField { _ in
        }
        
        let action = UIAlertAction(title: "Считай!", style: .default) { _ in
            let firstNumber = Int(alertController.textFields?[0].text ?? "0")
            let secondNumber = Int(alertController.textFields?[1].text ?? "0")
            let secondAlertController = UIAlertController(title: "Good job!", message: "Result", preferredStyle: .alert)
            let secondAction = UIAlertAction(title: "okay", style: .default, handler: nil)
            secondAlertController.addTextField { _ in
            }
            
            secondAlertController.textFields?[0].text = String((firstNumber ?? 0) + (secondNumber ?? 0))
            secondAlertController.addAction(secondAction)
            self.present(secondAlertController, animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertGuessNumber(tittle: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { _ in
        }
        let action = UIAlertAction(title: "Угадать!", style: .default) { _ in
            let guessNumber = Int.random(in: 1...3)
            
            if alertController.textFields?[0].text == String(guessNumber) {
                let winAlertController = UIAlertController(title: "Good job!",
                                                              message: "You are winner!", preferredStyle: .alert)
                let winAction = UIAlertAction(title: "okay", style: .default, handler: nil)
                winAlertController.addAction(winAction)
                self.present(winAlertController, animated: true, completion: nil)
            } else {
                let loseAlertController = UIAlertController(title: "Ha-ha-ha",
                                                              message: "You are loser!", preferredStyle: .alert)
                let loseAction = UIAlertAction(title: "Arghh", style: .default, handler: nil)
                loseAlertController.addAction(loseAction)
                self.present(loseAlertController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
