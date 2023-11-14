//
//  HistoryStoreDevData.swift
//  HiitFit
//
//  Created by Richie Flores on 11/1/23.
//

import Foundation

extension HistoryStore {
    // dummy data
    
    func createDevData() {
        let yesterday: Date = Date().addingTimeInterval(-86400)
        let twoDaysAgo: Date = Date().addingTimeInterval(-86400 * 2)
        
        let yesterdaysExercises: [String] = [
            Exercise.exercises[0].exerciseName,
            Exercise.exercises[1].exerciseName,
            Exercise.exercises[2].exerciseName
        ]
        
        let twoDaysAgoExercises: [String] = [
            Exercise.exercises[1].exerciseName,
            Exercise.exercises[0].exerciseName
        ]
        
        exerciseDays = [
            ExerciseDay(date: yesterday, exercises: yesterdaysExercises),
            ExerciseDay(date: twoDaysAgo, exercises: twoDaysAgoExercises)
        ]
    }
}
