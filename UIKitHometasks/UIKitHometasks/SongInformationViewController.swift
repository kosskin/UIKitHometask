//
//  SongInformationViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 26.09.2022.
//

import AVFoundation
import UIKit
/// эуран  с информаицей о песне
final class SongInformationViewController: UIViewController {

    // MARK: UI elements
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var player = AVAudioPlayer()
    var isPlaying: Bool = true
    var songs = [Song(name: "Патрон", singer: "MiYagi",
                      album: "какой-то альбом", picture: "album1", song: "patron"),
    Song(name: "Организация", singer: "Oxxxymiron",
         album: "хз альбом", picture: "album", song: "org")]
    
    var song: Int?
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    
    func configUI() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        guard let index = song else { return }
        albumLabel.text = songs[index].album
        songNameLabel.text = songs[index].name
        singerLabel.text = songs[index].singer
        pictureImageView.image = UIImage(named: songs[index].picture)
        slider.addTarget(self, action: #selector(settingSlider), for: .valueChanged)
        playingSong()
        player.play()
    }
    
    // MARK: Methods
    
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
