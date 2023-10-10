//
//  ConceptView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/10/23.
//

import SwiftUI
import AZVideoPlayer
import AVKit

struct ConceptView: View {
    var concept: Concept
    @State var player: AVPlayer?
    
    init(concept: Concept) {
        self.concept = concept
        self._player = State(wrappedValue: concept.player)
    }
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(concept.name).foregroundColor(.black)
            }
            Spacer()
            AZVideoPlayer(player: player)
                .aspectRatio(16/9, contentMode: .fit)
                .onAppear {
                    player?.play()
                    player?.volume = 0
                    
                }
                .onTapGesture {
                    player?.volume = 1
                    print("didTap")
                }
            Spacer()
            VStack {
                Text(concept.name).foregroundColor(.black)
            } .opacity(0)
            Spacer()
           
        } .navigationTitle(concept.name)
    }
    
    struct ConceptView_Previews: PreviewProvider {
        static var previews: some View {
            ConceptView(concept: Concept(name: "listen", icon: "circle.fill"))
        }
    }
}
