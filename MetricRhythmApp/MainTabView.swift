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
    
    var tabOneConfig: TabConfig {
        switch self {
        case .rhythm : return TabConfig(icon: "play.circle", label: "straight")
        case .harmony : return TabConfig(icon: "play.fill", label: "2-5-1")
        case .melody : return TabConfig(icon: "circle", label: "steps")
        }
        
    }
    var tabTwoConfig: TabConfig {
        switch self {
        case .rhythm : return TabConfig(icon: "play.fill", label: "swung")
        case .harmony : return TabConfig(icon: "play.circle", label: "1-4-5")
        case .melody : return TabConfig(icon: "circle.play", label: "skips")
        }
    }
    var beginnerButtonColor: Color {
        switch self {
        case .rhythm : return .yellow
        case .harmony : return .orange
        case .melody : return .blue
        }
    }
    var moderateButtonColor: Color {
        switch self {
        case .rhythm : return .gray
        case .harmony : return .teal
        case .melody : return .yellow
        }
    }
    var intermediateButtonColor: Color {
        switch self {
        case .rhythm : return .orange
        case .harmony : return .yellow
        case .melody : return .teal
        }
    }
    var advancedButtonColor: Color {
        switch self {
        case .rhythm : return .cyan
        case .harmony : return .red
        case .melody : return .orange
        }
    }
}

enum Tab {
    case meter
    case appendix
}

struct MainTabView: View {
    @State var category: Category = .rhythm
    @State var tab: Tab = .meter
    var body: some View {
        
        ZStack(alignment: .top) {
            TabView(selection: $tab) {
    //            The Text componants are creating the tab icons and text
                MeterView(meter: .straight, category: $category).tabItem {
                    Label(category.tabOneConfig.label,systemImage: category.tabOneConfig.icon)
                } .id(category).tag(Tab.meter)
                MeterView(meter: .swing, category: $category).tabItem {
                    Label(category.tabTwoConfig.label,systemImage: category.tabTwoConfig.icon)
                }.id(category).tag(Tab.meter)
                MeterView(meter: .combined, category: $category).tabItem {
                    Label("combined",systemImage: "rectangle")
                }.id(category).tag(Tab.meter)
                MeterView(meter: .improvise, category: $category).tabItem {
                    Label("immersion",systemImage: "rectangle.3.group")
                }.id(category).tag(Tab.meter)
                AppendixView().tabItem {
                    Label("appendix",systemImage: "list.bullet")
                }.tag(Tab.appendix)
            } .accentColor(.black)
            
            Picker("", selection: $category) {
                ForEach(Category.allCases) {category in
                    Text(category.rawValue).tag(category)
                }
            } .pickerStyle(.segmented).opacity(tab == .appendix ? 0 : 1)
            
        }
    }
}




struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
