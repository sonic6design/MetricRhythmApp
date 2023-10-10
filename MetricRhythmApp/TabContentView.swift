//
//  TabContentView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI
import AVKit

struct TabContentView: View {
    @State var previousButtonConfig:PatternButtonConfig?
    var tab: Tab
    @Binding var category: Category
    @State var videoPlayerViewIsPresented: Bool = false
    var body: some View {

        ZStack {
            Image(category.backgroundImage)
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.3)
//                .edgesIgnoringSafeArea([])
            VStack(spacing: UIScreen.main.bounds.height / 25) {
                VStack {
                    Text(tab.titleLabel(for: category)).font(.custom("Futura", size: 25).weight(.heavy))
                        .padding(5)
         
                    Text(tab.subTitleLabel(for: category)).font(.system(size: 15))
                }
    
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
                Button(action: {videoPlayerViewIsPresented = true}, label: {Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.black)
                }) .padding(.top,20)

            } .frame(width: UIScreen.main.bounds.width - 150)
                
        } .sheet(isPresented: $videoPlayerViewIsPresented, content:{ VideoPlayerView(url: tab.videoURL!)})
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
           
            
    }
}
struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView(tab: .straight,category: .constant(.rhythm), videoPlayerViewIsPresented: false)
    
    }
}
