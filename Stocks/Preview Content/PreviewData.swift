//
//  PreviewData.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import SwiftUI

extension Stock {
    static func anyStock(ticker: String = "SQ", currentPriceCents: Int = 6215, quantity: Int? = nil) -> Stock {
        Stock(
            ticker: ticker,
            name: "Block Inc",
            currency: "USD",
            currentPriceCents: currentPriceCents,
            quantity: quantity,
            currentPriceTimestamp: 1718570022
        )
    }

    static func anyStocks(count: Int = 3) -> [Stock] {
        Array(repeating: anyStock(ticker: UUID().uuidString), count: count)
    }
}

extension [Stock] {
    static func anyStocks(count: Int = 3) -> [Stock] {
        Array(repeating: Stock.anyStock(ticker: UUID().uuidString), count: count)
    }
}
