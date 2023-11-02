//
//  Concept.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/31/23.
//

import Foundation
import SwiftUI

struct Concept: Identifiable, Hashable {
    var id: String {
        name
    }
    var name: String
    var icon: String
    var description: String
    var subConcepts: [SubConcept] = []
}
