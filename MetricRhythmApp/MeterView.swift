//
//  TabContentView.swift
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
    
}
struct TabContentView: View {
    @State var previousButtonConfig:PatternButtonConfig?
    var tab: Tab
    @Binding var category: Category
    @State var videoPlayerViewIsPresented: Bool = false
    var body: some View {

        ZStack {
            Image(category.backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.3)
            HStack(alignment: .top) {
                VStack() {
                    Text(tab.titleLabel(for: category)).font(.custom("Futura", size: 20).weight(.bold))
                        .padding(.top,140)
                    Text(tab.subTitleLabel(for: category)).font(.system(size: 15))
                        .padding(.top,10)
                    Spacer()
                    
                    Button(action: {videoPlayerViewIsPresented = true}, label: {Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 40,height: 40)
                            .foregroundColor(.black)
                    })
                        .padding(.bottom,170)
                        
                }
            }
            VStack(spacing: 35) {
                ForEach(tab.buttonConfigs(category: category)) { config in
                    PatternButtonView(action: {
                        AudioPlayerManager.shared.stopPlayersBesides(currentTab: tab)
                        if let audioPlayer = AudioPlayerManager.shared.players[tab]{
                            audioPlayer.toggle(currentButtonConfig: config, previousButtonConfig: previousButtonConfig)
                        } else {
                            guard let url = Bundle.main.url(forResource: config.audioFile, withExtension: "aiff") else { return }
                            
                            let audioPlayer = AVPlayer(playerItem: AVPlayerItem(url: url))
                            AudioPlayerManager.shared.players[tab] = audioPlayer
                            audioPlayer.toggle(currentButtonConfig: config, previousButtonConfig: previousButtonConfig)
                        }
                        previousButtonConfig = config
                    }, config:config)
                }

            } .padding(.horizontal,75)
        } .sheet(isPresented: $videoPlayerViewIsPresented, content:{ VideoPlayerView(url: tab.videoURL!)})
    }
}
struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView(tab: .straight,category: .constant(.rhythm), videoPlayerViewIsPresented: false)
    
    }
}
