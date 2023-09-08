//
//  MainTabView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

enum Category: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    case rhythm = "Rhythm"
    case harmony
    case melody
}
struct MainTabView: View {
    @State var category: Category = .rhythm
    var body: some View {
        
        ZStack(alignment: .top) {
            TabView {
    //            The Text componants are creating the tab icons and text
                MeterView(meter: .straight, category: $category).tabItem {
                    Label("straight",systemImage: "rectangle.split.2x1")
                } .id(category)
                MeterView(meter: .swing, category: $category).tabItem {
                    Label("swing",systemImage: "rectangle.split.3x1")
                }.id(category)
                MeterView(meter: .combined, category: $category).tabItem {
                    Label("combined",systemImage: "rectangle")
                }.id(category)
                MeterView(meter: .improvise, category: $category).tabItem {
                    Label("immersion",systemImage: "rectangle.3.group")
                }.id(category)
                Text("appendix").tabItem {
                    Label("appendix",systemImage: "list.bullet")
                }
            }
            Picker("", selection: $category) {
                ForEach(Category.allCases) {category in
                    Text(category.rawValue).tag(category)
                }
            } .pickerStyle(.segmented)
            
        }
    }
}




struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
