//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// Главный ViewController
final class ViewController: UIViewController {

    // MARK: IBoutlets
    
    @IBOutlet private weak var stopWatchLabel: UILabel!
    @IBOutlet private weak var startStopButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: Private properties
    
    private var timer = Timer()
    private var isCounting = false
    private var plusTime = 0
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    
    @IBAction private func resetAction(_ sender: UIButton) {
        timer.invalidate()
        plusTime = 0
        stopWatchLabel.text = makeTimeString(hours: 0, minutes: 0, seconds: 0)
        startStopButton.setTitle("Start", for: .normal)

    }
    
    @IBAction private func startStopAction(_ sender: UIButton) {
        if isCounting {
            isCounting = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
        } else {
            isCounting = true
            startStopButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                selector: #selector(timeCounter), userInfo: next, repeats: true)
        }
    }
    
    // MARK: Methods
    
    @objc private func timeCounter() {
        plusTime += 1
        let time = secondsToHoursMinutesSeconds(seconds: plusTime)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        stopWatchLabel.text = timeString
    }
    
    private func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    private func format(timePart: Int) -> String {
        return String(format: "%02d", timePart)
    }
    
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        return "\(format(timePart: hours)):\(format(timePart: minutes)):\(format(timePart: seconds))"
    }
}
