//
//  PreviewData.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import SwiftUI

extension Stock {
    static func anyStock(ticker: String = "SQ") -> Stock {
        Stock(
            ticker: ticker,
            name: "Block Inc",
            currency: "USD",
            currentPriceCents: 6215,
            quantity: 2,
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
