//
//  HiitFitApp.swift
//  HiitFit
//
//  Created by Richie Flores on 10/20/23.
//

import SwiftUI

@main
struct HiitFitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("URL: \(URL.documentsDirectory)")
                }
        }
    }
}
