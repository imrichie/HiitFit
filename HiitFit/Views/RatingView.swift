//
//  RatingVIew.swift
//  HiitFit
//
//  Created by Richie Flores on 10/27/23.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { _ in
                    Image(systemName: "waveform.path.ecg")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    RatingView()
}
