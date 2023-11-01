//
//  ExerciseView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/25/23.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int
    let interval: TimeInterval = 3
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: exercise.exerciseName)
                    .padding()
                
                VideoPlayerView(exerciseName: exercise.videoName)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                    .padding()
                
                Button("Start/Done") {
                    print("Start/Done Button pressed")
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
    ExerciseView(index: 0)
}
