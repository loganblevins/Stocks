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
        VStack {
            Text(stock.currentPriceCents, format: .currency(code: stock.currency).scale(0.01))
                .font(.title)
                .bold()

            Text(.init(L10n.StockDetail.lastUpdated(stock.currentPriceTimeUpdated)))
        }
        .navigationTitle(stock.ticker)
    }
}

#if DEBUG
#Preview {
    StockDetail(stock: .anyStock())
}
#endif
