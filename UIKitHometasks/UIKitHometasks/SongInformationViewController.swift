//
//  SongInformationViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 26.09.2022.
//

import AVFoundation
import UIKit
/// viewController описывает экран с информаицей о песне
class SongInformationViewController: UIViewController {

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var imageViewPicture: UIImageView!
    
    var player = AVAudioPlayer()
    var isPlaying: Bool = true
    var songs = [Song(name: "Патрон", singer: "MiYagi",
                      album: "какой-то альбом", picture: "album1", song: "patron"),
    Song(name: "Организация", singer: "Oxxxymiron",
         album: "хз альбом", picture: "album", song: "org")]
    
    var song: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        slider.addTarget(self, action: #selector(settingSlider), for: .valueChanged)
        playingSong()
        player.play()
    }
    
    func configUI() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        guard let index = song else { return }
        albumLabel.text = songs[index].album
        songName.text = songs[index].name
        singerLabel.text = songs[index].singer
        imageViewPicture.image = UIImage(named: songs[index].picture)
    }
    
    func playingSong() {
        do {
            if let audioPath = Bundle.main.path(forResource: "patron", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error!")
        }
    }
    
    @objc func settingSlider(sender: UISlider) {
        if sender == sender {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @IBAction func playPauseButtonAction(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func closeScreenAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
