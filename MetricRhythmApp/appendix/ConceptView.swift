//
//  ConceptView.swift
//  MetricRhythmApp
//
//  Created by Matthew Novachis on 10/31/23.
//

import SwiftUI

struct ConceptView: View {
    var concept: Concept
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(concept.subConcepts) {subConcept in
                    NavigationLink(destination:  SubConceptView(subConcept: subConcept),  label: {
                        HStack {
                            Text(subConcept.name).foregroundColor(.black)
                            Spacer()
                            Image(systemName: subConcept.icon)
                        }.padding()
                    })
                }
            }
        }.navigationTitle(Text(concept.name))
    }
    }


struct ConceptView_Previews: PreviewProvider {
    static var previews: some View {
        ConceptView(concept: Concept (name: "listen", icon: "headphones",description: "Listening is the foundation of all musical skill and understanding")
)
    }
}
