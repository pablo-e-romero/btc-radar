//
//  HistoryView.swift
//  BTC Timeline
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import Observation

struct DayPreview {
    let id: String
    let day: String
    let value: String
}

extension DayPreview: Identifiable {}

extension DayPreview: Hashable {
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

@Observable
final class HistoryViewModel {
    var days: [DayPreview]

    init() {
        self.days = [
            .init(id: "1", day: "22/10/2025", value: "100.0000"),
            .init(id: "2", day: "21/10/2025", value: "100.0000"),
            .init(id: "3", day: "20/10/2025", value: "100.0000"),
        ]
    }
}


struct HistoryView: View {
    let viewModel: HistoryViewModel

    var body: some View {
        List(viewModel.days) { day in
            NavigationLink(value: HistoryRoute.dayDetail(day)) {
                DayPreviewView(day: day)
            }
        }
    }
}

struct DayPreviewView: View {
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
