//
//  Portfolio.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let portfolio = try? JSONDecoder().decode(Portfolio.self, from: jsonData)

import Foundation

// MARK: - Portfolio
struct Portfolio: Codable {
    let stocks: [Stock]
}

// MARK: - Stock
struct Stock: Codable {
    let ticker, name, currency: String
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: Int

    enum CodingKeys: String, CodingKey {
        case ticker, name, currency
        case currentPriceCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"
    }
}
