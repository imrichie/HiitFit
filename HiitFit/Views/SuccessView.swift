//
//  SuccessView.swift
//  HiitFit
//
//  Created by Richie Flores on 11/1/23.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            // 1st layer or Bottom
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedtoFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("""
                    Good job completing all four exercises!
                    Remember tomorrow's another day.
                    So eat well and get some rest.
                    """)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            }
            
            // 2nd layer
            VStack {
                Spacer()
                Button("Continue") {
                    print("Continue Button Pressed")
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    SuccessView()
}
