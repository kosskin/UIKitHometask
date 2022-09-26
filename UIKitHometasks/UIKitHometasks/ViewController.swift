//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// Главный ViewController
class ViewController: UIViewController {

    @IBOutlet weak var nameListLabel: UILabel!
    
    @IBOutlet weak var albumOneImageView: UIImageView!
    @IBOutlet weak var durationSongOneLabel: UILabel!
    @IBOutlet weak var lineOneView: UIView!
    
    @IBOutlet weak var albumTwoImageView: UIImageView!
    @IBOutlet weak var durationSongTwoLabel: UILabel!
    @IBOutlet weak var lineTwoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func songOneButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewContoller = storyboard.instantiateViewController(identifier:
                "SongInformationViewController") as? SongInformationViewController else { return }
        secondViewContoller.song = 0
        show(secondViewContoller, sender: nil)
    }
    
    @IBAction func songTwoButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewContoller = storyboard.instantiateViewController(identifier:
                "SongInformationViewController") as? SongInformationViewController else { return }
        secondViewContoller.song = 1
        show(secondViewContoller, sender: nil)
    }
}
