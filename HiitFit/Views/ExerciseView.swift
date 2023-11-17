//
//  ExerciseView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/25/23.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    // observed properties
    @State private var showHistory: Bool = false
    @State private var showSuccess: Bool = false
    @State private var timerDone: Bool = false
    @State private var showTimer: Bool = false

    @Binding var selectedTab: Int
    
    @EnvironmentObject var history: HistoryStore
    
    // instance properties
    let index: Int
    
    // computed properties
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start") {
            showTimer.toggle()
        }
    }
    
    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(exercise.exerciseName)
            
            timerDone = false
            showTimer.toggle()
            
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding()
                
                VideoPlayerView(exerciseName: exercise.videoName)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()
                
                if showTimer {
                    TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
                }
                
                Spacer()
                
                RatingView(exerciseIndex: index)
                    .padding()
                
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory, content: {
                    HistoryView(showHistory: $showHistory)
                })
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
        .environmentObject(HistoryStore())
}
