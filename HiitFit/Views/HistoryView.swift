//
//  HistoryView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/30/23.
//

import SwiftUI

struct HistoryView: View {
    // Constants
    private static let secondsInDay: TimeInterval = 86400
    
    // Dates
    let today = Date()
    let yesterday = Date().addingTimeInterval(-HistoryView.secondsInDay)
    
    // Exercises
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    HistoryView()
}
