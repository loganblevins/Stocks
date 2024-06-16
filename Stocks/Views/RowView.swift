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
            VStack(alignment: .listRowSeparatorLeading) {
                Text(stock.ticker)
                    .font(.title)
                    .bold()

                Text(stock.name)
                    .font(.headline)
                    .fontWeight(.light)
            }
            .padding()

            Spacer(minLength: 0)

            Text(stock.currentPriceCents, format: .currency(code: stock.currency).scale(0.01))
                .font(.title3)

            Spacer(minLength: 0)

            VStack(alignment: .listRowSeparatorTrailing) {
                Text("\(stock.quantity ?? 0)")
                    .font(.callout)
                    .fontWeight(.light)

                Text(stock.currentPriceCents * (stock.quantity ?? 0), format: .currency(code: stock.currency).scale(0.01))
                    .font(.title3)
            }
            .padding()
        }
        .frame(height: 50)
    }
}

#if DEBUG
#Preview {
    RowView(stock: .anyStock())
}
#endif
