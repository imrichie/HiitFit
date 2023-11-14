//
//  ContentView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 9
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // first tab
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)
            
            // other tabs
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .environmentObject(HistoryStore())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
