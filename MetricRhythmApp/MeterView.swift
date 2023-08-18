//
//  MeterView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

enum Meter {
    case straight
    case swing
    case combined
    case improvise
    
    var backgroundColor: Color {
        switch self {
        case .straight: return .cyan
        case .swing: return .orange
        case .combined: return .yellow
        case .improvise: return .teal
        }
    }
    var titleLabel: String {
        switch self {
        case .straight: return "level one"
        case .swing: return "level two"
        case .combined: return "level three"
        case .improvise: return "level 4"
        }
    }
    var videoFileName: String {
        switch self {
        case .straight: return "DanielPink.1"
        case .swing: return "level two"
        case .combined: return "level three"
        case .improvise: return "level 4"
        }
    }
    var videoURL: URL? {
        return Bundle.main.url(forResource: videoFileName, withExtension: "mp4")
    }
}
struct MeterView: View {
    var meter: Meter
    @State var videoPlayerViewIsPresented: Bool = false
    var body: some View {
        
        ZStack {
            Image("sheetMusicEdited 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.3)
            HStack(alignment: .top) {
                VStack {
                    Text(meter.titleLabel)
                        .padding(.top,75)
                    Text(meter.titleLabel)
                        .padding(.top,10)
                   Spacer()
                    Button(action: {videoPlayerViewIsPresented = true}, label: {Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.black)
                    })
                        .padding(.bottom,130)
                        
                }
            }
            VStack(spacing: 35) {
                PatternButtonView(config: .init(color: .yellow, text: "straight", textColor: .black))
                PatternButtonView(config: .init(color: .gray, text: "swing", textColor: .black
                                               ))
                PatternButtonView(config: .init(color: .orange, text: "combined", textColor: .black))
                PatternButtonView(config: .init(color: .teal, text: "immersion", textColor: .black))

            } .padding(.horizontal,75)
        } .sheet(isPresented: $videoPlayerViewIsPresented, content:{ VideoPlayerView(url: meter.videoURL!)})
    }
}
struct MeterView_Previews: PreviewProvider {
    static var previews: some View {
        MeterView(meter: .straight, videoPlayerViewIsPresented: false)
    
    }
}
