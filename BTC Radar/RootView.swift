//
//  RootView.swift
//  BTC Radar
//
//  Created by Pablo Romero on 30/6/25.
//

import SwiftUI

@Observable
final class RootViewModel {
    var selection: Section

    init(selection: Section) {
        self.selection = selection
    }
}

enum Section {
    case live
    case history
}

struct RootView: View {
    @Bindable var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TabView(selection: $viewModel.selection) {
            LiveView(viewModel: .init())
                .tabItem {
                    Label("Live", systemImage: "bitcoinsign")
                }
                .tag(Section.live)

            HistoryView(viewModel: .init())
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
                .tag(Section.history)
        }
    }
}
