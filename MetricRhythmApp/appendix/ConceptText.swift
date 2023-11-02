//
//  ConceptText.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/24/23.
//

import Foundation

enum ConceptText: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    case listen
    case imagine
    case imitate
    case respond
    case mood
    case movement
    
//    enum associated values with each case inside of ConceptText
    var conceptText: String{
        switch self {
        case .listen : return "Listening is the foundation of all musical understanding"
        case .imagine : return "Our imagination absorbs the sounds of music through active listening"
        case .imitate : return "Imitating musical sounds builds our vocabulary of musical patterns and phrases or We develop our musical vocabulary by imiating musical sounds"
        case .respond : return "Experimenting with our own response to musical sounds develops our ability to communicate with our musical vocabulary. "
        default: return "error"
        }
    }
}
