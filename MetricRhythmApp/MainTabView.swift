//
//  MainTabView.swift
//  test
//
//  Created by Matthew Novachis on 7/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
//            The Text componants are creating the tab icons and text
            MeterView(meter: .straight).tabItem {
                Label("straight",systemImage: "rectangle.split.2x1")
            }
            MeterView(meter: .swing).tabItem {
                Label("swing",systemImage: "rectangle.split.3x1")
            }
            MeterView(meter: .combined).tabItem {
                Label("combined",systemImage: "rectangle")
            }
            MeterView(meter: .improvise).tabItem {
                Label("immersion",systemImage: "rectangle.3.group")
            }
            Text("appendix").tabItem {
                Label("appendix",systemImage: "list.bullet")
            }
        }
    }
}

struct HarmonicView: View {
    var body: some View {
        TabView {
//            The Text componants are creating the tab icons and text
            MeterView(meter: .straight).tabItem {
                Label("I - V",systemImage: "rectangle.split.2x1")
            }
            MeterView(meter: .swing).tabItem {
                Label("I - IV - V",systemImage: "rectangle.split.3x1")
            }
            MeterView(meter: .combined).tabItem {
                Label("ii - V - I",systemImage: "rectangle")
            }
            MeterView(meter: .improvise).tabItem {
                Label("I - V - vi - IV",systemImage: "rectangle.3.group")
            }
            Text("appendix").tabItem {
                Label("appendix",systemImage: "list.bullet")
            }
        }
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
