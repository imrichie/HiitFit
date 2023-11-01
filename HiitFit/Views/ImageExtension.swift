//
//  ImageExtension.swift
//  HiitFit
//
//  Created by Richie Flores on 11/1/23.
//

import SwiftUI


extension Image {
    /// Resize an image with fill aspect ratio and specified frame dimensions
    ///  - parameters:
    ///     - width: Frame width
    ///     - height: Frame height.
    
    func resizedtoFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}
