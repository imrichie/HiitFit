//
//  VideoPlayerView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/27/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var exerciseName: String

    var body: some View {
        if let url = Bundle.main.url(forResource: exerciseName, withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 20)
        } else {
            Text("Video not found")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    VideoPlayerView(exerciseName: "squat")
}
