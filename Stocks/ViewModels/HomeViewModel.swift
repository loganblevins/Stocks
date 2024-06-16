//
//  HomeViewModel.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import Combine

enum DataStatus {
    case error(Error)
    case success([Stock])
}

final class HomeViewModel: ObservableObject {

    init(dataStore: some DataStore) {
        self.dataStore = dataStore
    }

    @Published var status: DataStatus?

    var sortedStocks: [Stock] {
        guard case let .success(stocks) = status else { return [] }
        return stocks.sorted { $0.ticker < $1.ticker }
    }

    func fetch() {
        task = dataStore.fetchPortfolio()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                if case .failure(let error) = result {
                    self?.status = .error(error)
                }
            }, receiveValue: { [weak self] in
                self?.status = .success($0)
            })
    }

    private var task: AnyCancellable?

    private let dataStore: DataStore
}

