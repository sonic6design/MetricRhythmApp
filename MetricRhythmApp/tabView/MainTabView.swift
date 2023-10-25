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
//    Removed this string ("Rhythm") from case rhythm 10.24.23
    case rhythm
    case harmony
    case melody 
    
    var beginnerButtonColor: Color {
        switch self {
        case .rhythm : return .rgb(38, 87, 124)
        case .harmony : return .rgb(229, 86, 4)
        case .melody : return .rgb(244, 209, 96)
        }
    }
    var moderateButtonColor: Color {
        switch self {
        case .rhythm : return .rgb(38, 87, 124)
        case .harmony : return .rgb(229, 86, 4)
        case .melody : return .rgb(244, 209, 96)
        }
    }
    var intermediateButtonColor: Color {
        switch self {
        case .rhythm : return .rgb(38, 87, 124)
        case .harmony : return .rgb(229, 86, 4)
        case .melody : return .rgb(244, 209, 96)
        }
    }
    var advancedButtonColor: Color {
        switch self {
        case .rhythm : return .rgb(38, 87, 124)
        case .harmony : return .rgb(229, 86, 4)
        case .melody : return .rgb(244, 209, 96)
        }
    }
    var tabAccentColor: Color {
        switch self {
        case .rhythm : return .rgb(38, 87, 124)
        case .harmony : return .rgb(229, 86, 4)
        case .melody : return .rgb(244, 209, 96)
        }
    }
    var backgroundImage: String {
        switch self {
        case .rhythm: return "rhythmBackground"
        case .harmony: return "rhythmBackground"
        case .melody: return "sheetMusicEdited 1"
        }
    }
    var tabs: [Tab] {
        switch self {
        case .rhythm: return [.straight, .swung, .combined]
        case .harmony: return [.major, .minor]
        case .melody: return [.steps, .skips, .leaps]
        }
    }
}

enum Tab: String, Identifiable  {
    var id: String {
        rawValue
    }
    case straight
    case swung
    case combined
    case improvise
    case major
    case minor
    case combinedHarmony
    case steps
    case skips
    case leaps
    case appendix
    var backgroundColor: Color {
        switch self {
        case .straight: return .cyan
        case .swung: return .orange
        case .combined: return .yellow
        default: return .blue
        }
    }
    func titleLabel(for category: Category) -> String {
        switch category {
        case .rhythm:
            switch self {
            case .straight: return "Rhythm"
            case .swung: return "Rhythm"
            case .combined: return "Rhythm"
            default: return "Rhythm"
            }
        case .harmony:
            switch self {
            case .straight: return "Harmony"
            case .swung: return "Harmony"
            case .combined: return "Harmony"
            default: return "Harmony"
            }
        case .melody:
            switch self {
            case .straight: return "Melody"
            case .swung: return "Melody"
            case .combined: return "Melody"
            default: return "Melody"
            }
        }
        
    }
    func subTitleLabel(for category: Category) -> String {
        return rawValue
    }
    var videoFileName: String {
        switch self {
        case .straight: return "DanielPink.1"
        case .swung: return "DanielPink.1"
        case .combined: return "DanielPink.1"
        default: return "Harmony"
        }
    }
    var videoURL: URL? {
        return Bundle.main.url(forResource: videoFileName, withExtension: "mp4")
    }
    var config: TabConfig {
        switch self {
        case .straight: return TabConfig(icon: "circle", label: "straight")
        case .swung: return TabConfig(icon: "circle", label: "swung")
        case .combined: return TabConfig(icon: "circle", label: "combined")
        case .major: return TabConfig(icon: "square", label: "Major")
        case .minor: return TabConfig(icon: "square", label: "minor")
        case .steps: return TabConfig(icon: "rectangle", label: "steps")
        case .skips: return TabConfig(icon: "rectangle", label: "skips")
        case .leaps: return TabConfig(icon: "rectangle", label: "leaps")
        default: return  TabConfig(icon: "square", label: "swung")
        }
    }
    func buttonConfigs(category: Category) -> [PatternButtonConfig] {
        switch self {
        case .straight: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle.fill", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "circle.fill", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "circle.fill", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "circle.fill", textColor: .yellow, audioFile: "PatternDemo"),
           
        ]
        case .swung: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle.fill", textColor: .orange, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "circle.fill", textColor: .orange, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "circle.fill", textColor: .orange, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "circle.fill", textColor: .orange, audioFile: "PatternDemo"),
        
        ]
        case .combined: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle.fill", textColor: .red, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "circle.fill", textColor: .red, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "circle.fill", textColor: .red, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "circle.fill", textColor: .red, audioFile: "PatternDemo"),
    
        ]
        case .major: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "square.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "square.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "square.fill", textColor: .cyan, audioFile: "PatternDemo")
        ]
        case .minor: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "square.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "square.fill", textColor: .mint, audioFile: "PatternDemo")
        ]
        case .steps: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "seal.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "seal.fill", textColor: .cyan, audioFile: "PatternDemo")
        ]
        case .skips: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "seal.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .mint, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "seal.fill", textColor: .mint, audioFile: "PatternDemo")
        ]
        case .leaps: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "seal.fill", textColor: .blue, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .blue, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "seal.fill", textColor: .blue, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "seal.fill", textColor: .blue, audioFile: "PatternDemo"),
        ]
        default: return []
        }
    }
}
struct MainTabView: View {
    @State var category: Category = .rhythm
    @State var tab: Tab = .straight
    var body: some View {
        
        ZStack(alignment: .top) {
            TabView(selection: $tab) {
                ForEach(category.tabs) { tab in
                    TabContentView(tab: tab, category: $category).tabItem {
                        Label(tab.config.label,systemImage: tab.config.icon)
                    } .id(category).tag(tab)
                }
                AppendixView().tabItem {
                    Label("appendix",systemImage: "list.bullet")
                }.id(category).tag(Tab.appendix)
            } .accentColor(category.tabAccentColor)
            
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
