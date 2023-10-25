//
//  VideoPlayerView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 8/7/23.
//

import SwiftUI
import AZVideoPlayer
import AVKit

struct VideoPlayerView: View {
    var url: URL
    var body: some View {
        AZVideoPlayer(player: AVPlayer(url: url))
        
    }
}

//struct VideoPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPlayerView(url: Bundle.main.url(forResource: "DanielPink.1", withExtension: "mp4")!)
//    }
//}
