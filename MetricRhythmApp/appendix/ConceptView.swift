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
    //    var image: Image
    @State var player: AVPlayer?
    @State var didTap: Bool = false
    
    init(concept: Concept) {
        self.concept = concept
        
        //        self.image = image
        
        self._player = State(wrappedValue: concept.player)
    }
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("circle")
                Text(concept.name)
                    .foregroundColor(.black)
                    .font(.largeTitle)
            }
            .padding(20)
            Text(concept.description)
                .multilineTextAlignment(.center)
            Spacer()
            AZVideoPlayer(player: player)
                .aspectRatio(16/9, contentMode: .fit)
            
                .if(!didTap) { view in
                    view.onAppear {
                        player?.play()
                        player?.volume = 0
                    }
                }
                .if(!didTap) { view in
                    view.onTapGesture {
                        player?.volume = 1
                        print("didTap")
                        didTap = true
                    }
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
            ConceptView(concept: .init(name: "listen", icon: "circle", description: "Experimenting with our own response to musical sounds develops our ability to communicate with our musical vocabulary."))    }
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

