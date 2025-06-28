//
//  DayView.swift
//  BTC Radar
//
//  Created by Pablo Romero on 22/6/25.
//

import SwiftUI

@Observable
final class DayDetailViewModel {
    let value: String
    let day: String

    init(preview: DayPreview) {
        self.value = preview.value
        self.day = preview.day
    }
}

struct DayDetailView: View {
    let viewModel: DayDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.value)
            Text(viewModel.day)
        }
    }
}

#Preview {
    DayDetailView(viewModel: .init(preview: .init(id: "1", day: "20/10/2025", value: "100.000")))
}

