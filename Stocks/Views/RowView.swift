//
//  RowView.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import SwiftUI

struct RowView: View {

    let stock: Stock

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(stock.ticker)
                    .font(.title2)
                    .bold()

                Text(stock.name)
                    .font(.headline)
                    .fontWeight(.light)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text(stock.currentPriceCents, format: .currency(code: stock.currency).scale(0.01))
                .font(.title3)
                .fixedSize()
                .frame(maxWidth: .infinity)

            VStack(alignment: .trailing) {
                Text("\(stock.quantity ?? 0)")
                    .font(.callout)
                    .fontWeight(.light)

                Text(stock.currentPriceCents * (stock.quantity ?? 0), format: .currency(code: stock.currency).scale(0.01))
                    .font(.title3)
            }
            .fixedSize()
            .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .lineLimit(1)
    }
}

#if DEBUG
#Preview {
    RowView(stock: .anyStock())
}
#endif
