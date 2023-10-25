//
//  PatternButtonConfig.swift
//  test
//
//  Created by Madeline Novachis on 7/19/23.
//

import SwiftUI

struct PatternButtonConfig: Identifiable,Equatable  {
    var id: UUID
    
    var color: Color
    var text: String?
    var icon: String?
    var textColor: Color
    var audioFile: String
    
    static func beginner(audioFile:String = "PatternDemo",color: Color = .yellow) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, icon: "waveform", textColor: .black, audioFile: audioFile)
    }
    
    static func moderate(audioFile:String = "PatternDemo",color: Color = .gray) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, icon: "sun.min", textColor: .black,audioFile: audioFile)
    }
    
    static func intermediate(audioFile:String = "PatternDemo",color: Color = .orange) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, icon: "sparkles", textColor: .black,audioFile: audioFile)
    }
    
    static func advanced(audioFile:String = "PatternDemo",color: Color = .cyan) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, icon: "aqi.medium", textColor: .black,audioFile: audioFile)
    }
    init(id: UUID = UUID(), color: Color, text: String, textColor: Color, audioFile: String) {
        self.id = id
        self.color = color
        self.text = text
        self.icon = nil
        self.textColor = textColor
        self.audioFile = audioFile
    }
    init(id: UUID = UUID(), color: Color, icon: String, textColor: Color, audioFile: String) {
        self.id = id
        self.color = color
        self.text = nil
        self.icon = icon
        self.textColor = textColor
        self.audioFile = audioFile
    }
}


    
