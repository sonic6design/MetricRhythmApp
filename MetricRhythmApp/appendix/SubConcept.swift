//
//  SubConcept.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/31/23.
//

import Foundation
import AVKit

struct SubConcept: Identifiable, Hashable {
    var id: String {
        name
    }
    var name: String
    var icon: String
    var description: String
    
    var videoURL: URL? = Bundle.main.url(forResource: "DanielPink.1", withExtension: "mp4")
    var player: AVPlayer? {
        guard let url = videoURL else {
            return nil
        }
        return AVPlayer(url: url)
    }
}
