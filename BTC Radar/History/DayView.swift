//
//  DayView.swift
//  BTC Radar
//
//  Created by Pablo Romero on 22/6/25.
//

import SwiftUI
import MEUtils

@Observable
final class DayViewModel: HashableObject {
    let value: String
    let day: String

    init(preview: DayPreview) {
        self.value = preview.value
        self.day = preview.day
    }
}

struct DayView: View {
    let viewModel: DayViewModel

    var body: some View {
        VStack {
            Text(viewModel.value)
        }
        .navigationTitle(viewModel.day)
    }
}

#Preview {
    DayView(viewModel: DayViewModel(preview: .init(id: "1", day: "20/10/2025", value: "100.000")))
}

