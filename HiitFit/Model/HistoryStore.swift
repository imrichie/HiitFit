//
//  HistoryStore.swift
//  HiitFit
//
//  Created by Richie Flores on 10/31/23.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    // Initializer
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
