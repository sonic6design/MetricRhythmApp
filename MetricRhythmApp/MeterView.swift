//
//  MeterView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

enum Meter {
    case binary
    case triple
    case combined
    case improvise
    
    var backgroundColor: Color {
        switch self {
        case .binary: return .cyan
        case .triple: return .orange
        case .combined: return .yellow
        case .improvise: return .teal
        }
    }
}
struct MeterView: View {
    var meter: Meter
    var body: some View {
        ZStack {
            Image("sheetMusicEdited 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.3)

            VStack(spacing: 40) {
                PatternButtonView(config: .init(color: .cyan, text: "binary", textColor: .white))
                PatternButtonView(config: .init(color: .cyan, text: "triple", textColor: .white))
                PatternButtonView(config: .init(color: .cyan, text: "combined", textColor: .white))
                PatternButtonView(config: .init(color: .cyan, text: "improvise", textColor: .white))

            } .edgesIgnoringSafeArea(.all)
                .padding(60)
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct MeterView_Previews: PreviewProvider {
    static var previews: some View {
        MeterView(meter: .binary)
        MeterView(meter: .triple)
        MeterView(meter: .combined)
        MeterView(meter: .improvise)
    }
}
