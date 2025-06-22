//
//  SettingsView.swift
//  BTC Radar
//
//  Created by Pablo Romero on 22/6/25.
//

import SwiftUI


struct Currency {
    let id: String
    let name: String
}

extension Currency: Identifiable { }

extension Currency: Hashable {
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

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
        Form {
            Picker("Currency", selection: $viewModel.selection) {
                ForEach(viewModel.currencies) { currency in
                    Text(currency.name)
                        .tag(currency)
                }
            }
            .pickerStyle(.inline)
        }
    }
}

#Preview {
    SettingsView(viewModel: .init())
}
