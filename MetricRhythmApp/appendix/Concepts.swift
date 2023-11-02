//
//  Concepts.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/31/23.
//

import Foundation

struct Concepts {
    static let listenSubConcepts: [SubConcept] = [SubConcept(name: "listen", icon: "circle", description: "BLAH")]
    static let all: [Concept] = [
        Concept (name: "listen", icon: "headphones",description: "Listening is the foundation of all musical skill and understanding",subConcepts: listenSubConcepts),
        Concept (name: "imagine", icon: "ellipsis.bubble",description: "Our imagination absorbs the sounds of music through active listening"),
        Concept(name: "imitate", icon: "repeat",description: "Imitating musical sounds develops our vocabulary of musical patterns and phrases"),
        Concept (name: "experiment", icon: "shuffle", description: "Experimenting with how we respond to musical sounds develops our ability to create and communicate with music."),
        Concept(name: "playlist", icon: "play", description: "Put together a playlist of music to represent each category"),
        Concept(name: "return", icon: "play", description: "Put together a playlist of music to represent each category"),
        Concept(name: "matt", icon: "play", description: "Put together a playlist of music to represent each category"),
        Concept(name: "madeline", icon: "play", description: "Put together a playlist of music to represent each category"),
        Concept(name: "otto", icon: "play", description: "Put together a playlist of music to represent each category"),
        Concept(name: "ivan", icon: "play", description: "Put together a playlist of music to represent each category")
    ]
}
