//
//  RatingVIew.swift
//  HiitFit
//
//  Created by Richie Flores on 10/27/23.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    
    @AppStorage("ratings") private var ratings: String = ""
    @State private var rating = 0
    
    // properties
    let onColor = Color.red
    let offColor = Color.gray
    
    // initializer
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(toLength: desiredLength, withPad: "0", startingAt: 0)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor : onColor)
                    .onAppear {
                        convertRating()
                    }
                    .onTapGesture {
                        updateRating(index: index)
                    }
                    .onChange(of: ratings) {
                        convertRating()
                    }
            }
        }
        .font(.largeTitle)
    }
    
    // methods 
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        ratings.replaceSubrange(index ... index, with: String(rating))
    }
    
    func convertRating() {
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        let character = ratings[index]
        
        rating = character.wholeNumberValue ?? 0
    }
}

#Preview {
    RatingView(exerciseIndex: 0)
}
