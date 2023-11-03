//
//  HeaderView.swift
//  HiitFit
//
//  Created by Richie Flores on 10/26/23.
//

import SwiftUI

struct HeaderView: View {
    // observable properties
    @Binding var selectedTab: Int
    
    // parameters
    let titleText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    activePage(for: index)
                }
            }
            .font(.title2)
        }
    }
    
    // functions
    func activePage(for index: Int) -> some View {
        let imageName = (index == selectedTab) ? "\(index).circle.fill" : "\(index).circle"
        return Group {
            Image(systemName: imageName)
                .onTapGesture {
                    selectedTab = index
                }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(selectedTab: .constant(1), titleText: "Blah")
}
