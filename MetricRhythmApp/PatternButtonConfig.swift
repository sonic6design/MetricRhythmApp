//
//  PatternButtonConfig.swift
//  test
//
//  Created by Madeline Novachis on 7/19/23.
//

import SwiftUI

struct PatternButtonConfig: Identifiable,Equatable  {
    var id: UUID = UUID()
    
    var color: Color
    var text: String
    var textColor: Color
    var audioFile: String
    
    static func beginner(audioFile:String = "PatternDemo",color: Color = .yellow) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, text: "beginner", textColor: .black, audioFile: audioFile)
    }
    
    static func moderate(audioFile:String = "PatternDemo",color: Color = .gray) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, text: "moderate", textColor: .black,audioFile: audioFile)
    }
    
    static func intermediate(audioFile:String = "PatternDemo",color: Color = .orange) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, text: "intermediate", textColor: .black,audioFile: audioFile)
    }
    
    static func advanced(audioFile:String = "PatternDemo",color: Color = .cyan) -> PatternButtonConfig {
        return PatternButtonConfig(color: color, text: "advanced", textColor: .black,audioFile: audioFile)
    }
}


    
