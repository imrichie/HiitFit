//
//  SuccessView.swift
//  HiitFit
//
//  Created by Richie Flores on 11/1/23.
//

import SwiftUI

struct SuccessView: View {
    @State private var rotationAmount: Double = -20
    
    var body: some View {
        ZStack {
            // 1st layer or Bottom
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedtoFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                    .rotationEffect(.degrees(rotationAmount))
                    .onAppear() {
                        withAnimation(
                            Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                            rotationAmount = 20
                        }
                    }
                
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
