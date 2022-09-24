//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//

import UIKit
/// Контроллер отвечает за главный экран с двумя  играми
class GameChoiceViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureAlertController(title: "Готов к игре?", message: "Введите имя", style: .alert)
    }

    @IBAction func plusButtonAction(_ sender: UIButton) {
        alertSum(title: "Играем!", message: "Введи 2 числа", style: .alert)
    }
    
    @IBAction func guessNumberButtonAction(_ sender: UIButton) {
        alertGuessNumber(tittle: "Играем!", message: "Загадал от 1 до 3", style: .alert)
    }
    
    func configureAlertController(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Давай!", style: .default) { _ in
            let text = alertController.textFields?.first
            guard let textInTextField = text?.text else { return }
            
            if textInTextField.isEmpty {
                self.hiLabel.text = "Начинаем, незнакомец?"
            } else {
                self.hiLabel.text = "Начинаем, \(textInTextField)?"
            }
        }
        
        alertController.addTextField { _ in
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertSum(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { _ in
        }
        
        alertController.addTextField { _ in
        }
        
        let alertAction = UIAlertAction(title: "Считай!", style: .default) { _ in
            let firstNumber = Int(alertController.textFields?[0].text ?? "0")
            let secondNumber = Int(alertController.textFields?[1].text ?? "0")
            let resultAlertController = UIAlertController(title: "Good job!", message: "Result", preferredStyle: .alert)
            let resultAlertAction = UIAlertAction(title: "okay", style: .default, handler: nil)
            resultAlertController.addTextField { _ in
            }
            
            resultAlertController.textFields?[0].text = String((firstNumber ?? 0) + (secondNumber ?? 0))
            resultAlertController.addAction(resultAlertAction)
            self.present(resultAlertController, animated: true, completion: nil)
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertGuessNumber(tittle: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { _ in
        }
        let alertAction = UIAlertAction(title: "Угадать!", style: .default) { _ in
            let guessNumber = Int.random(in: 1...3)
            
            if alertController.textFields?[0].text == String(guessNumber) {
                let winAlertController = UIAlertController(title: "Good job!",
                                                              message: "You are winner!", preferredStyle: .alert)
                let alertControllerWinAction = UIAlertAction(title: "okay", style: .default, handler: nil)
                winAlertController.addAction(alertControllerWinAction)
                self.present(winAlertController, animated: true, completion: nil)
            } else {
                let loseAlertController = UIAlertController(title: "Ha-ha-ha",
                                                              message: "You are loser!", preferredStyle: .alert)
                let alertControllerLoseAction = UIAlertAction(title: "Arghh", style: .default, handler: nil)
                loseAlertController.addAction(alertControllerLoseAction)
                self.present(loseAlertController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
