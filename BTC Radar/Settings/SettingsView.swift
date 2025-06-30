//
//  SettingsView.swift
//  BTC Radar
//
//  Created by Pablo Romero on 22/6/25.
//

import SwiftUI


@Observable
final class SettingsViewModel {
    let currencies: [Currency]
    var selection: Currency

    init() {
        self.currencies = [
            .init(id: "1", name: "USD"),
            .init(id: "2", name: "EUR"),
            .init(id: "3", name: "Pound")
        ]
        self.selection = .init(id: "1", name: "USD")
    }
}


struct SettingsView: View {
    @Bindable var viewModel: SettingsViewModel

    var body: some View {
        NavigationStack {
            Form {
                Picker("Currency", selection: $viewModel.selection) {
                    ForEach(viewModel.currencies) { currency in
                        Text(currency.name)
                            .tag(currency)
                    }
                }
                .pickerStyle(.inline)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(viewModel: .init())
}
