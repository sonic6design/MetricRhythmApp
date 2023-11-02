//
//  AppendixView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 9/8/23.
//

import SwiftUI
import AVKit

struct AppendixView: View {
    @State var concepts: [Concept] = Concepts.all
    
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




struct AppendixView_Previews: PreviewProvider {
    static var previews: some View {
        AppendixView()
    }
}
