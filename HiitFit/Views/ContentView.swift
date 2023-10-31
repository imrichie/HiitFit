//
//  ContentView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(Exercise.exercises.indices, id: \.self) { exercise in
                ExerciseView(index: exercise)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}

