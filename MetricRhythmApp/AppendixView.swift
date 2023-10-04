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
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(concepts) {concept in
                        HStack {
                            NavigationLink(concept.name, value: concept)
                        Spacer()
                            Image(systemName: concept.icon)
                        }.padding()
                    }
                }
            } .navigationDestination(for: Concept.self) {concept in
                Text(concept.name)
            }
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
