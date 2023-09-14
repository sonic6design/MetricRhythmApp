//
//  AppendixView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 9/8/23.
//

import SwiftUI

struct AppendixView: View {
    @State var concepts: [Concept] = [
        Concept (name: "practice", icon: "person")
        
    ]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(concepts) {concept in
                    HStack {
                        Text(concept.name)
                    Spacer()
                        Image(systemName: concept.icon)
                    }.padding()
                }
            }
        }
    }
}

struct Concept: Identifiable {
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
