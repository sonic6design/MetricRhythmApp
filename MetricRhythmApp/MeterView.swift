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
        case .swing: return "DanielPink.1"
        case .combined: return "DanielPink.1"
        case .improvise: return "DanielPink.1"
        }
    }
    var videoURL: URL? {
        return Bundle.main.url(forResource: videoFileName, withExtension: "mp4")
    }
    var buttonConfigs: [PatternButtonConfig] {
        switch self {
        case .straight: return [.beginner(audioFile: "PatternDemo"),.moderate(audioFile: ""),.intermediate(),.advanced(),]
        case .swing: return [.beginner(),.moderate(),.intermediate(),.advanced()]
        case .combined: return [.beginner(),.moderate(),.intermediate(),.advanced()]
        case .improvise: return [.beginner(),.moderate(),.intermediate(),.advanced()]
        }
        
    }
  
}
struct MeterView: View {
    @State var previousButtonConfig:PatternButtonConfig?
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
                ForEach(meter.buttonConfigs) { config in
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
        MeterView(meter: .straight, videoPlayerViewIsPresented: false)
    
    }
}
