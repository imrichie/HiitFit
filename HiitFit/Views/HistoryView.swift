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
    let yesterday = Date().addingTimeInterval(-secondsInDay)
    
    // Exercises - Dummy Data
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text(today.formatted(as: "MMM d"))) {
                    ForEach(exercises1, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                
                Section(header: Text(yesterday.formatted(as: "MMM d"))) {
                    ForEach(exercises2, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
