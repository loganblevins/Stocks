//
//  Routes.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import SwiftUI
import Navigation

enum PortfolioRoutes: Routable {
    case stockDetail(stock: Stock)

    public var body: some View {
        switch self {
        case .stockDetail(stock: let stock):
            StockDetail(stock: stock)
        }
    }
}
