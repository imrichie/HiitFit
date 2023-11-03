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
        Button("Start Exercise") {
            print("Start button pressed")
        }
    }
    
    var doneButton: some View {
        Button("Done") {
            selectedTab = lastExercise ? 9 : selectedTab + 1
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: exercise.exerciseName)
                    .padding()
                
                VideoPlayerView(exerciseName: exercise.videoName)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                
                // timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                    .padding()
                
                HStack(spacing: 100) {
                    startButton
                    doneButton
                }
                .font(.title3)
                .padding()
                
                RatingView()
                    .padding()
                
                Spacer()
                Button("History") {
                    print("History Button Pressed")
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 0)
}
