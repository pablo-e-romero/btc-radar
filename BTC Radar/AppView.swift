//
//  AppView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import MEUI

enum HistoryRoute: Routable {
    case history
    case dayDetail(DayPreview)
}

extension HistoryRoute {
    @ViewBuilder var body: some View {
        switch self {
        case .history: HistoryView(viewModel: .init())
        case let .dayDetail(preview): DayDetailView(viewModel: .init(preview: preview))
        }
    }
}


@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LiveView(viewModel: .init())
                    .tabItem {
                        Label("Live", systemImage: "bitcoinsign")
                    }
                RouterView(route: HistoryRoute.history)
                    .tabItem {
                        Label("History", systemImage: "calendar")
                    }
            }
        }
    }
}
