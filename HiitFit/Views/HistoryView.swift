//
//  HistoryView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/30/23.
//

import SwiftUI

struct HistoryView: View {
    
    let history: HistoryStore = HistoryStore()
    
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
            
            Form {
                ForEach(history.exerciseDays) { day in
                    Section(header: Text(day.date.formatted(as: "MMM d")).font(.headline)) {
                        ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
