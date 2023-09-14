//
//  MeterView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI
import AVKit


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
    func titleLabel(for category: Category) -> String {
        switch category {
        case .rhythm:
            switch self {
            case .straight: return "Meter"
            case .swing: return "Meter"
            case .combined: return "Meter"
            case .improvise: return "Meter"
            }
        case .harmony:
            switch self {
            case .straight: return "level one"
            case .swing: return "level two"
            case .combined: return "level three"
            case .improvise: return "level 4"
            }
        case .melody:
            switch self {
            case .straight: return "level one"
            case .swing: return "level two"
            case .combined: return "level three"
            case .improvise: return "level 4"
            }
        }
        
    }
    func subTitleLabel(for category: Category) -> String {
        switch category {
        case .rhythm:
            switch self {
            case .straight: return "straight"
            case .swing: return "swing"
            case .combined: return "combined"
            case .improvise: return "improvise"
            }
        case .harmony:
            switch self {
            case .straight: return "level one"
            case .swing: return "level two"
            case .combined: return "level three"
            case .improvise: return "level 4"
            }
        case .melody:
            switch self {
            case .straight: return "level one"
            case .swing: return "level two"
            case .combined: return "level three"
            case .improvise: return "level 4"
            }
        }
        
    }
    var videoFileName: String {
        switch self {
        case .straight: return "DanielPink.1"
        case .swing: return "DanielPink.1"
        case .combined: return "DanielPink.1"
        case .improvise: return "DanielPink.1"
        }
    }
    var videoURL: URL? {
        return Bundle.main.url(forResource: videoFileName, withExtension: "mp4")
    }
    func buttonConfigs(category: Category) -> [PatternButtonConfig] {
        switch self {
        case .straight: return [
            .beginner(audioFile: "PatternDemo",color: category.beginnerButtonColor),
            .moderate(audioFile: "",color: category.moderateButtonColor),
            .intermediate(color: category.intermediateButtonColor),
            .advanced(color: category.advancedButtonColor)
        ]
        case .swing: return [
            .beginner(color: category.beginnerButtonColor),
            .moderate(color: category.moderateButtonColor),
            .intermediate(color: category.intermediateButtonColor),
            .advanced(color: category.advancedButtonColor)
        ]
        case .combined: return [
            .beginner(color: category.beginnerButtonColor),
            .moderate(color: category.moderateButtonColor),
            .intermediate(color: category.intermediateButtonColor),
            .advanced(color: category.advancedButtonColor)
        ]
        case .improvise: return [
            .beginner(color: category.beginnerButtonColor),
            .moderate(color: category.moderateButtonColor),
            .intermediate(color: category.intermediateButtonColor),
            .advanced(color: category.advancedButtonColor)
        ]
        }
        
    }
  
}
struct MeterView: View {
    @State var previousButtonConfig:PatternButtonConfig?
    var meter: Meter
    @Binding var category: Category
    @State var videoPlayerViewIsPresented: Bool = false
    var body: some View {

        ZStack {
            Image("sheetMusicEdited 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.3)
            HStack(alignment: .top) {
                VStack {
                    Text(meter.titleLabel(for: category))
                        .padding(.top,140)
                    Text(meter.subTitleLabel(for: category))
                        .padding(.top,10)
                   Spacer()
                    Button(action: {videoPlayerViewIsPresented = true}, label: {Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 40,height: 40)
                            .foregroundColor(.black)
                    })
                        .padding(.bottom,130)
                        
                }
            }
            VStack(spacing: 35) {
                ForEach(meter.buttonConfigs(category: category)) { config in
                    PatternButtonView(action: {
                        AudioPlayerManager.shared.stopPlayersBesides(currentMeter: meter)
                        if let audioPlayer = AudioPlayerManager.shared.players[meter]{
                            audioPlayer.toggle(currentButtonConfig: config, previousButtonConfig: previousButtonConfig)
                        } else {
                            guard let url = Bundle.main.url(forResource: config.audioFile, withExtension: "aiff") else { return }
                            
                            let audioPlayer = AVPlayer(playerItem: AVPlayerItem(url: url))
                            AudioPlayerManager.shared.players[meter] = audioPlayer
                            audioPlayer.toggle(currentButtonConfig: config, previousButtonConfig: previousButtonConfig)
                        }
                        previousButtonConfig = config
                    }, config:config)
                }

            } .padding(.horizontal,75)
        } .sheet(isPresented: $videoPlayerViewIsPresented, content:{ VideoPlayerView(url: meter.videoURL!)})
    }
}
struct MeterView_Previews: PreviewProvider {
    static var previews: some View {
        MeterView(meter: .straight,category: .constant(.rhythm), videoPlayerViewIsPresented: false)
    
    }
}
