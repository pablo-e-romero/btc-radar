//
//  AppView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel(selection: .live))
        }
    }
}
