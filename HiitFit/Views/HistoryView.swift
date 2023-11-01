//
//  HistoryView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/30/23.
//

import SwiftUI

struct HistoryView: View {
    
    // Create an instance of the HistoryStore to fetch and store exercise data
    let history: HistoryStore = HistoryStore()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {}, label: {
                Image(systemName: "xmark.circle")
            })
            .font(.title)
            .padding(.trailing)
            
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                
                Form {
                    // iterate over each day in the history
                    ForEach(history.exerciseDays) { day in
                        // create a section for each day with the day
                        Section(header: Text(day.date.formatted(as: "MMM d")).font(.headline)) {
                            // iterate over each exercise for that specific day
                            ForEach(day.exercises, id: \.self) { exercise in
                                // display the name of the exercise
                                Text(exercise)
                            }
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
