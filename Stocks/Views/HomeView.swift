//
//  HomeView.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import SwiftUI
import Navigation

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ContentView()
                .environmentObject(viewModel)
        }
        .onAppear {
            viewModel.fetch()
        }
        .refreshable {
            viewModel.fetch()
        }
    }
}

#if DEBUG
#Preview {
    HomeView(
        viewModel: HomeViewModel(
            dataStore: MockStore(
                stocks: [
                    .anyStock(ticker: "SQ"),
                    .anyStock(ticker: "AAPL"),
                    .anyStock(ticker: "GOOG")
                ]
            )
        )
    )
}
#endif

