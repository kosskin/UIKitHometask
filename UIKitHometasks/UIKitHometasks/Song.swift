//
//  Song.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 26.09.2022.
//

import Foundation
/// Модель для песен
class Song {
    let name: String
    let singer: String
    let album: String
    let picture: String
    let song: String
    init(name: String, singer: String, album: String, picture: String, song: String) {
        self.name = name
        self.singer = singer
        self.album = album
        self.picture = picture
        self.song = song
    }
}
