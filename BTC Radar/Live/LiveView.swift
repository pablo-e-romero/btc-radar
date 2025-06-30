//
//  ContentView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import Observation

enum LiveState {
    case loaded
    case loading
    case error
}

@Observable
class LiveViewModel {
    var value: String
    var updateAt: String
    var state: LiveState

    init() {
        self.value = "10.000$"
        self.updateAt = "12/03/2005 13:45"
        self.state = .loaded
    }
}


struct LiveView: View {
    let viewModel: LiveViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.value)
                Text(viewModel.updateAt)
            }
            .navigationTitle("Live")
        }
    }
}

#Preview {
    LiveView(viewModel: .init())
}
