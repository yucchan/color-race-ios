//
//  Untitled.swift
//  color-race-ios
//
//  Created by Yuliya Smirnova on 22/01/2025.
//

import AVFAudio

// Helper class for audio playback
class AVAudioPlayerWrapper {
    private var player: AVAudioPlayer?

    func playSound(named name: String) {
        print("playing sound \(name)")
        if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound \(name): \(error.localizedDescription)")
            }
        } else {
            print("Sound file \(name).mp3 not found")
        }
    }
}

