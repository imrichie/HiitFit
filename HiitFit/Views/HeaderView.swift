//
//  HeaderView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/26/23.
//

import SwiftUI

struct HeaderView: View {
    // parameters
    let exerciseName: String
    
    var body: some View {
        VStack {
            Text(exerciseName)
                .font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(exerciseName: "Blah")
}
