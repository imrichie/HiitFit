//
//  HistoryStore.swift
//  HiitFit
//
//  Created by Richie Flores on 10/31/23.
//

import Foundation

// enums for errors
enum FileError: Error {
    case loadFailure
    case saveFailure
}

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    @Published var loadingError: Bool = false
    
    var dataURL: URL {
        URL.documentsDirectory.appendingPathComponent("history.plist")
    }
    
    // Initializer
    init() {
        do {
            try load()
        } catch {
            loadingError = true 
        }
    }
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date,
           today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
        
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save() throws {
        let plistData: [[Any]] = exerciseDays.map { exerciseDays in
            [
                exerciseDays.id.uuidString,
                exerciseDays.date,
                exerciseDays.exercises
            ]
        }
        
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: plistData, format: .binary, options: .zero)
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
    
    func load() throws {
        throw FileError.loadFailure
    }
}
