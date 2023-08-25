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
    
    static func beginner(audioFile:String = "PatternDemo") -> PatternButtonConfig {
        
        return PatternButtonConfig(color: .yellow, text: "beginner", textColor: .black, audioFile: audioFile)
    }
    static func moderate(audioFile:String = "PatternDemo") -> PatternButtonConfig {
        
        return PatternButtonConfig(color: .gray, text: "moderate", textColor: .black,audioFile: audioFile)
    }
    static func intermediate(audioFile:String = "PatternDemo") -> PatternButtonConfig {
        
        return PatternButtonConfig(color: .orange, text: "intermediate", textColor: .black,audioFile: audioFile)
    }
    static func advanced(audioFile:String = "PatternDemo") -> PatternButtonConfig {
        
        return PatternButtonConfig(color: .cyan, text: "advanced", textColor: .black,audioFile: audioFile)
    }
}


    
