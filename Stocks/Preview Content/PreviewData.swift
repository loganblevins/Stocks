//
//  PreviewData.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static func anyStock() -> Stock {
        Stock(
            ticker: "SQ",
            name: "Block Inc",
            currency: "USD",
            currentPriceCents: 6215,
            quantity: nil,
            currentPriceTimestamp: 1718570022
        )
    }
}
