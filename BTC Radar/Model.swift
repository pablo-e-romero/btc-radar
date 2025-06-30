//
//  Model.swift
//  BTC Radar
//
//  Created by Pablo Romero on 30/6/25.
//

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
