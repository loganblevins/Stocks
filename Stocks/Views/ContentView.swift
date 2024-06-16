//
//  ContentView.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import SwiftUI
import Navigation

struct ContentView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @EnvironmentObject private var router: Router<PortfolioRoutes>

    var body: some View {
        if let status = viewModel.status {
            switch status {
            case .error(let error):
                ErrorView(message: error.localizedDescription, content: refreshButton)
            case .success:
                if viewModel.sortedStocks.isEmpty {
                    emptyView
                } else {
                    populatedView
                }
            }
        } else {
            ProgressView()
        }
    }

    private var emptyView: some View {
        VStack {
            Text(.init(L10n.HomeView.Message.empty))
                .font(.title)

            refreshButton
        }
        .padding()
    }

    private var populatedView: some View {
        List(viewModel.sortedStocks, id: \.ticker) { stock in
            RowView(stock: stock)
                .contentShape(Rectangle())
                .onTapGesture {
                    router.push(.stockDetail(stock: stock))
                }
        }
        .navigationTitle(.init(L10n.HomeView.title))
    }

    private struct ErrorView<Content: View>: View {
        let message: String
        let content: Content

        var body: some View {
            VStack {
                Text(.init(message))
                    .font(.title)

                content
            }
            .padding()
        }
    }

    private var refreshButton: some View {
        Button {
            viewModel.fetch()
        } label: {
            Text(.init(L10n.HomeView.Button.refresh))
                .font(.title3)
        }
        .buttonStyle(.borderedProminent)
    }
}
