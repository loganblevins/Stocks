//
//  StockDetail.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import SwiftUI

struct StockDetail: View {
    let stock: Stock

    var body: some View {
        Text(.init(L10n.StockDetail.lastUpdated(stock.currentPriceTimeUpdated)))
            .navigationTitle(stock.ticker)
    }
}

#if DEBUG
#Preview {
    StockDetail(stock: .anyStock())
}
#endif
