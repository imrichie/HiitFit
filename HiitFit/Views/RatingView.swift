//
//  RatingVIew.swift
//  HiitFit
//
//  Created by Richie Flores on 10/27/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    // properties
    let onColor = Color.red
    let offColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
