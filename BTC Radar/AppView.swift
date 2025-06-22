//
//  AppView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import MEUI

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LiveView(viewModel: .init())
                    .tabItem {
                        Label("Live", systemImage: "bitcoinsign")
                    }
                HistoryView()
                    .tabItem {
                        Label("History", systemImage: "calendar")
                    }
            }
        }
    }
}
