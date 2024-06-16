//
//  RemoteStore.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import Combine

// Test URL malformed data: https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json
// Test URL empty data: https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json

final class RemoteStore: DataStore {
    enum Endpoints: String {
        case portfolio = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"

        var url: URL? {
            URL(string: rawValue)
        }
    }

    func fetchPortfolio() -> AnyPublisher<[Stock], Error> {
        guard let url = Endpoints.portfolio.url else {
            return Fail(error: DataStoreError.badUrl(Endpoints.portfolio.rawValue))
                .eraseToAnyPublisher()
        }

        return URLSession(configuration: .ephemeral)
            .dataTaskPublisher(for: url)
            .retry(3)
            .mapError { error in DataStoreError.transport(error.code.rawValue) }
            .map(\.data)
            .decode(type: Portfolio.self, decoder: JSONDecoder())
            .map(\.stocks)
            .mapError { error in error is DataStoreError ? error : DataStoreError.unknown }
            .eraseToAnyPublisher()
    }
}

