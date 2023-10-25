//
//  AppendixView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 9/8/23.
//

import SwiftUI
import AVKit

struct AppendixView: View {
    @State var concepts: [Concept] = [
        Concept (name: "listen", icon: "circle.fill",description: "lsd"),
        Concept (name: "imagine", icon: "square.fill",description: "bla"),
        Concept(name: "imitate", icon: "hexagon.fill",description: "blas"),
        Concept (name: "respond", icon: "rectangle.fill", description: "blah"),
        
        
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(concepts) {concept in
                        NavigationLink(destination:  ConceptView(concept: concept),  label: {
                            HStack {
                                Text(concept.name).foregroundColor(.black)
                                Spacer()
                                Image(systemName: concept.icon)
                            }.padding()
                        })
                    }
                }
            }.navigationTitle(Text("appendix"))
            
        }
    }
    
}


struct Concept: Identifiable, Hashable {
    var id: String {
        name
    }
    var name: String
    var icon: String
    var description: String
    
    var videoURL: URL? = Bundle.main.url(forResource: "DanielPink.1", withExtension: "mp4")
    var player: AVPlayer? {
        guard let url = videoURL else {
            return nil
        }
        return AVPlayer(url: url)
    }
}

struct AppendixView_Previews: PreviewProvider {
    static var previews: some View {
        AppendixView()
    }
}
