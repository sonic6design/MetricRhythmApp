//
//  ColorExtension.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 9/19/23.
//

import Foundation
import SwiftUI

extension Color {
    static func rgb(_ r: Double, _ g: Double, _ b: Double) -> Color {
        return Color(red: r/255, green: g/255, blue: b/255)
    }
}
