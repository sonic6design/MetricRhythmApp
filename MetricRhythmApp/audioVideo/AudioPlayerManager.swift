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
    
    var players: [Tab:AVPlayer] = [:]
    
    func stopPlayersBesides(currentTab: Tab) {
        for  (tab,player) in players {
            if tab != currentTab {
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
