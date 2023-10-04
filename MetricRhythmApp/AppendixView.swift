//
//  AppendixView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 9/8/23.
//

import SwiftUI

struct AppendixView: View {
    @State var concepts: [Concept] = [
        Concept (name: "practice", icon: "person"),
        Concept (name: "blah", icon: "circle")
        
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(concepts) {concept in
                        NavigationLink(destination:  Text(concept.name), label: {
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
}

struct AppendixView_Previews: PreviewProvider {
    static var previews: some View {
        AppendixView()
    }
}
