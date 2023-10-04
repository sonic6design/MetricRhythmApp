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
    
    var beginnerButtonColor: Color {
        switch self {
//            rgb(38, 87, 124) rgb(229, 86, 4) rgb(180, 180, 179) rgb(235, 228, 209)
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
        case .rhythm: return "rhythmPagesForApp"
        case .harmony: return "sheetMusicEdited 1"
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
        switch category {
        case .rhythm:
            switch self {
            case .straight: return "straight"
            case .swung: return "swung"
            case .combined: return "combined"
            default: return "tab name here"
            }
        case .harmony:
            switch self {
            case .straight: return "Major"
            case .swung: return "minor"
            case .combined: return "combined"
            default: return "tab name here"
            }
        case .melody:
            switch self {
            case .straight: return "steps"
            case .swung: return "skips"
            case .combined: return "leaps"
            default: return "tab name here"
            }
        }
        
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
//            .beginner(audioFile: "PatternDemo",color: category.beginnerButtonColor),
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .red, audioFile: "PatternDemo"),
//            .moderate(audioFile: "",color: category.moderateButtonColor),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .red, audioFile: "PatternDemo"),
//            .intermediate(color: category.intermediateButtonColor),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "triangle", textColor: .red, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle", textColor: .red, audioFile: "PatternDemo"),
           
//            .advanced(color: category.advancedButtonColor)
        ]
        case .swung: return [
//            .beginner(color: category.beginnerButtonColor),
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "capsule", textColor: .red, audioFile: "PatternDemo"),
//            .moderate(color: category.moderateButtonColor),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "oval", textColor: .red, audioFile: "PatternDemo"),
//            .intermediate(color: category.intermediateButtonColor),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "diamond", textColor: .red, audioFile: "PatternDemo"),
//            .advanced(color: category.advancedButtonColor)
            PatternButtonConfig(color: category.advancedButtonColor, icon: "octagon", textColor: .red, audioFile: "PatternDemo"),
        
        ]
        case .combined: return [
//            .beginner(color: category.beginnerButtonColor),
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "hexagon", textColor: .red, audioFile: "PatternDemo"),
//            .moderate(color: category.moderateButtonColor),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "pentagon", textColor: .red, audioFile: "PatternDemo"),
//            .intermediate(color: category.intermediateButtonColor),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "seal", textColor: .red, audioFile: "PatternDemo"),
//            .advanced(color: category.advancedButtonColor)
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rhombus", textColor: .red, audioFile: "PatternDemo"),
    
        ]
        case .major: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.intermediateButtonColor, icon: "triangle", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle.roundedtop", textColor: .yellow, audioFile: "PatternDemo")
        ]
        case .minor: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "triangle", textColor: .yellow, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle", textColor: .yellow, audioFile: "PatternDemo")
        ]
        case .steps: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "viewfinder", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle.roundedbottom", textColor: .cyan, audioFile: "PatternDemo")
        ]
        case .skips: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "triangle", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle", textColor: .cyan, audioFile: "PatternDemo")
        ]
        case .leaps: return [
            PatternButtonConfig(color: category.beginnerButtonColor, icon: "circle", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "square", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.moderateButtonColor, icon: "triangle", textColor: .cyan, audioFile: "PatternDemo"),
            PatternButtonConfig(color: category.advancedButtonColor, icon: "rectangle", textColor: .cyan, audioFile: "PatternDemo"),
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
