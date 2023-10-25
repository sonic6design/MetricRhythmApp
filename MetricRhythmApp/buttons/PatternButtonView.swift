//
//  PatternButtonView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

struct PatternButtonView: View {
    var action: () -> Void
    var config: PatternButtonConfig
    
    var body: some View {
        Button(action: action,
               label: {PatternButtonViewLabel(config: config)})
        .buttonStyle(PatternButtonStyle(config: config))
    }
}

struct PatternButtonViewLabel: View {
    var config: PatternButtonConfig
    var body: some View {
        if let text = config.text {
            Text(text)
        } else if let icon = config.icon {
            Image(systemName: icon)
        } else {
            EmptyView()
        }
    }

}

struct PatternButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PatternButtonView(action: {}, config: PatternButtonConfig(color: .cyan, icon: "straight", textColor: .white, audioFile: "")
        )}
}



