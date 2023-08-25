//
//  AudioPlayerManager.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 8/25/23.
//

import SwiftUI
import AVKit

class AudioPlayerManager {
    static let shared = AudioPlayerManager()
    
    var players: [Meter:AVPlayer] = [:]
    
    func stopPlayersBesides(currentMeter: Meter) {
        for  (meter,player) in players {
            if meter != currentMeter {
                player.pause()
            }
        }
    }
    
}

extension AVPlayer {
    var isPlaying: Bool {
        return timeControlStatus == .playing
    }
    func toggle(currentButtonConfig:PatternButtonConfig,previousButtonConfig:PatternButtonConfig?) {
        if isPlaying {
            pause()
            if currentButtonConfig != previousButtonConfig {
               restart()
            }
        } else {
           restart()
        }
    }
    func restart() {
        seek(to: .zero)
        play()
        
    }
}
