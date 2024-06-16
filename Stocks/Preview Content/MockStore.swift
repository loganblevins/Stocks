//
//  MockStore.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import Combine

final class MockStore: DataStore {
    init(stocks: [Stock]? = nil, error: Error? = nil) {
        self.stocks = stocks
        self.error = error
    }

    var stocks: [Stock]?
    var error: Error?

    func fetchPortfolio() -> AnyPublisher<[Stock], Error> {
        if let stocks {
            return Just<[Stock]>(stocks)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else if let error {
            return Fail(error: error)
                .eraseToAnyPublisher()
        } else {
            return Empty()
                .eraseToAnyPublisher()
        }
    }
}
