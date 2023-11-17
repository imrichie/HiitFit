//
//  HiitFitApp.swift
//  HiitFit
//
//  Created by Richie Flores on 10/20/23.
//

import SwiftUI

@main
struct HiitFitApp: App {
    @StateObject private var historyStore: HistoryStore = HistoryStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .onAppear {
                    print("URL: \(URL.documentsDirectory)")
                }
                .alert(isPresented: $historyStore.loadingError) {
                    Alert(
                        title: Text("History"),
                        message: Text(
                        """
                        Error loading your past history.
                        Email Support:
                        support@f12software.com
                        """))
                }
        }
    }
}
