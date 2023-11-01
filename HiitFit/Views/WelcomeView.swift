//
//  WelcomeView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/25/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            // bottom or 1st layer
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History", action: {
                    print("History Button Pressed")
                })
                .padding(.bottom)
            }
            
            // center or 2nd layer
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedtoFill(width: 240, height: 240)
                        .clipShape(Circle())
                }
                Button(action: {
                    print("Get Started button pressed")
                }, label: {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                })
                .font(.title2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20.0).stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

#Preview {
    WelcomeView()
}
