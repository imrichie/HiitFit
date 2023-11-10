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
    @State private var rating: Int = 0
    @State private var showHistory: Bool = false
    @State private var showSuccess: Bool = false

    @Binding var selectedTab: Int
    
    // instance properties
    let index: Int
    let interval: TimeInterval = 30
    
    // computed properties
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start") {
            print("Start button pressed")
        }
    }
    
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding()
                
                VideoPlayerView(exerciseName: exercise.videoName)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                
                // timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                    .padding()
                
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .sheet(isPresented: $showSuccess, content: {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        })
                }
                .font(.title3)
                .padding()
                
                RatingView(rating: $rating)
                    .padding()
                
                Spacer()
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
}
