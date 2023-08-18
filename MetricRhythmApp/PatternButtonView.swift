//
//  PatternButtonView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

struct PatternButtonView: View {
    var config: PatternButtonConfig
    
    var body: some View {
        Button(action: {print("press")},
               label: {Text(config.text)})
        .buttonStyle(PatternButtonStyle(config: config))
}
                                        
struct PatternButtonView_Previews: PreviewProvider {
            static var previews: some View {
                PatternButtonView(config: PatternButtonConfig(color: .cyan, text: "straight", textColor: .white)
            )}
        }
}
                                       
        
