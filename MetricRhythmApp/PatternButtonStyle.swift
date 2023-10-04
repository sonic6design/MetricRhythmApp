//
//  PatternButtonStyle.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

struct PatternButtonStyle: ButtonStyle {
    var config: PatternButtonConfig

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height / 15)
            .background(config.color)
            .foregroundColor(config.textColor)
            .patternButtonBorder()
            .cornerRadius(5)
    }
    }
struct BorderModifier: ViewModifier {
    var color: Color
    var textColor: Color
    var cornerRadius: CGFloat
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
//            .padding()
            .background(color)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.black,lineWidth: width)
            )
    }
}
extension View {
    func patternButtonBorder() -> some View {
        self.modifier(BorderModifier(color: .black, textColor: .white, cornerRadius: 2, width: 2))
    }
}


