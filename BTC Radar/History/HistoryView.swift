//
//  HistoryView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import Observation

@Observable
final class HistoryViewModel {
    var days: [DayPreview]

    enum Path: Hashable {
        case day(DayViewModel)
    }

    var path: [Path]

    init(path: [Path] = []) {
        self.days = [
            .init(id: "1", day: "22/10/2025", value: "100.0000"),
            .init(id: "2", day: "21/10/2025", value: "100.0000"),
            .init(id: "3", day: "20/10/2025", value: "100.0000"),
        ]
        self.path = path
    }
}


struct HistoryView: View {
    @Bindable var viewModel: HistoryViewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List(viewModel.days) { day in
                NavigationLink(value: HistoryViewModel.Path.day(DayViewModel(preview: day))) {
                    HistoryRowView(day: day)
                }
            }
            .navigationTitle("History")
            .navigationDestination(for: HistoryViewModel.Path.self) { path in
                switch path {
                case let .day(viewModel): DayView(viewModel: viewModel)
                }
            }
        }
    }
}

struct HistoryRowView: View {
    let day: DayPreview

    var body: some View {
        HStack {
            Text(day.day)
            Text(day.value)
        }
    }
}

#Preview {
    HistoryView(viewModel: .init())
}
