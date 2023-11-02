//
//  ConceptView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/10/23.
//

import SwiftUI
import AZVideoPlayer
import AVKit

struct SubConceptView: View {
    var subConcept: SubConcept
    //    var image: Image
    @State var player: AVPlayer?
    @State var didTap: Bool = false
    
    init(subConcept: SubConcept) {
        self.subConcept = subConcept
        
        //        self.image = image
        
        self._player = State(wrappedValue: subConcept.player)
    }
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("circle")
                Text(subConcept.name)
                    .foregroundColor(.black)
                    .font(.largeTitle).fontWeight(.medium)
//                    .font(.custom("Futura", size: 25).weight(.heavy))
            }
            .padding(10)
            Text(subConcept.description)
//                .padding(.top,1)
                .multilineTextAlignment(.center)
                .padding(.leading,40)
                .padding(.trailing,40)
                .padding(.bottom,30)
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
            Spacer()
            VStack {
                Text(subConcept.name).foregroundColor(.black)
            } .opacity(0)
            Spacer()
        } .navigationTitle(subConcept.name)
    }
    
    struct ConceptView_Previews: PreviewProvider {
        static var previews: some View {
            SubConceptView(subConcept: .init(name: "listen", icon: "circle", description: "The subConcepts can be available for those that want to dive deeper into the rabbit hole of information"))
        }
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

